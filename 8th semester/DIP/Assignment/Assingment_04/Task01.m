% Read the input image
inputImage = imread('house.png');

% Convert the image to grayscale if necessary
if size(inputImage, 3) > 1
    grayImage = rgb2gray(inputImage);
else
    grayImage = inputImage;
end

% Apply a 3x3 moving average filter
smoothed = conv2(double(grayImage), ones(3)/9, 'same');

% Compute the gradient magnitude using the Sobel operator
gradMag = sqrt(imfilter(smoothed, fspecial('sobel').').^2 + imfilter(smoothed, fspecial('sobel')).^2);

% Threshold the gradient magnitude
threshold = 0.2 * max(gradMag(:)); % Adjust the threshold as needed
edgeMap = gradMag > threshold;

% Remove hidden objects using the edge map
outputImage = inputImage;
outputImage(repmat(edgeMap, [1, 1, size(inputImage, 3)])) = 0;

% Display the output image
figure;
subplot(1, 2, 1);
imshow(inputImage);
title('Input Image');
subplot(1, 2, 2);
imshow(outputImage);
title('Output Image (Objects Removed)');