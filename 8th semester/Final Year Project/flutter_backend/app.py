from flask import Flask, request, jsonify
from flask_cors import CORS
import numpy as np
import pandas as pd
import pickle
from PIL import Image
import cv2
from skimage.color import rgb2hsv, rgb2gray
from skimage.filters import threshold_otsu, gaussian
from scipy import ndimage as ndi
from skimage import morphology
import scipy
import binascii

app = Flask(__name__)
CORS(app)


@app.route('/', methods=['GET', 'POST'])
def predict():
    image_file = request.files['imageFile']
    if not image_file:
        return jsonify({'error': 'No file uploaded'})

    image = np.array(Image.open(image_file))
    image = image[:, :, :3]

    # Image processing steps
    gray_image = rgb2gray(image)
    blurred_image = gaussian(gray_image, sigma=2)
    threshold = threshold_otsu(blurred_image)
    mask = (blurred_image > threshold).astype(np.uint8)

    if np.mean(mask[:20, :20] + mask[-20:, -20:] + mask[:20, -20:] + mask[-20:, :20]) > np.mean(mask):
        mask = 1 - mask

    filled_mask = ndi.binary_fill_holes(mask)
    mask_postprocessed = morphology.binary_closing(
        filled_mask, morphology.disk(8))
    cleaned = morphology.remove_small_objects(mask_postprocessed, 301)
    filled_mask = ndi.binary_fill_holes(cleaned)
    eroded = ndi.binary_erosion(filled_mask, np.ones((2, 2)))
    filled_mask = ndi.binary_fill_holes(eroded)
    image[filled_mask == 0] = 0

    # Save processed image
    with open('train_err.pkl', 'wb') as file:
        pickle.dump(image, file)

    train_colour = {}
    n_clusters = 2
    red = []
    green = []
    blue = []

    for row in image:
        for pixel in row:
            red_value, green_value, blue_value = pixel
            red.append(red_value)
            green.append(green_value)
            blue.append(blue_value)

    pixels = pd.DataFrame({'red': red, 'green': green, 'blue': blue})
    std_red, std_green, std_blue = pixels[['red', 'green', 'blue']].std()
    pixels['scaled_red'] = scipy.cluster.vq.whiten(red)
    pixels['scaled_green'] = scipy.cluster.vq.whiten(green)
    pixels['scaled_blue'] = scipy.cluster.vq.whiten(blue)

    cluster_centers, distortion = scipy.cluster.vq.kmeans(
        pixels[['scaled_red', 'scaled_green', 'scaled_blue']], n_clusters)

    vecs, dist = scipy.cluster.vq.vq(
        pixels[['scaled_red', 'scaled_green', 'scaled_blue']], cluster_centers)
    counts, bins = np.histogram(vecs, len(cluster_centers))
    sorted_indices = counts.argsort()[-2:]
    center_colours = []

    for center in cluster_centers:
        scaled_r, scaled_g, scaled_b = center
        center_colours.append((
            scaled_r * std_red,
            scaled_g * std_green,
            scaled_b * std_blue
        ))

    def extract_gem_colour(colours):
        max_sum = 0
        max_index = 0
        for x in sorted_indices:
            max_index = np.argmax(
                np.sum([center_colours[x] for x in sorted_indices], axis=1))
        return colours[sorted_indices[max_index]]

    try:
        gem_colour = extract_gem_colour(center_colours)
        hex_colour = binascii.hexlify(
            bytearray(int(c) for c in gem_colour)).decode('ascii')
        print('Gemstone colour is %s (#%s)' % (gem_colour, hex_colour))
    except ValueError:
        pass

    def find_color_histogram(image, n_bin):
        hist = cv2.calcHist([image], [0, 1, 2], None, [
                            n_bin, n_bin, n_bin], [1, 256, 1, 256, 1, 256])
        hist = cv2.normalize(hist, hist)
        hist = hist.flatten()
        return hist

    color_histogram = find_color_histogram(image, 8)
    global_test_feature = np.hstack([color_histogram])

    with open('trained_model.pkl', 'rb') as file:
        model = pickle.load(file)

    with open('encoder.pkl', 'rb') as enc:
        encoder = pickle.load(enc)

    global_test_feature = global_test_feature.reshape((1, 512))
    pred = model.predict(global_test_feature)
    prediction = encoder.inverse_transform(pred)
    prediction_str = ''.join(prediction)

    print(prediction_str)
    return jsonify({'prediction': prediction_str, 'color': hex_colour})


if __name__ == '__main__':
    app.run(debug=True)
