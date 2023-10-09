% Read the input image
gray_image = imread('lena.png');

% Define the threshold value
threshold = 50;

% Apply thresholding to the grayscale image
thresholded_image = gray_image;
thresholded_image(gray_image < threshold) = 0;
thresholded_image(gray_image >= threshold) = 255;

% Display the original and thresholded images
subplot(1, 2, 1);
imshow(gray_image);
title('Original Image');
subplot(1, 2, 2);
imshow(thresholded_image);
title('Thresholded Image');
