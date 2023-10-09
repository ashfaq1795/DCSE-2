clc
clear all
close all;

% Read the original image
originalImageGray = imread('house.png');


% Add salt and pepper noise to the image
noisyImage = imnoise(originalImageGray, 'salt & pepper', 0.2);

% Display the original and noisy images
figure;
subplot(1, 2, 1);
imshow(originalImageGray);
title('Original Image');
subplot(1, 2, 2);
imshow(noisyImage);
title('Noisy Image');

% Apply Median filter
medianFiltered = medfilt2(noisyImage);

% Apply Min filter
minFiltered = ordfilt2(noisyImage, 1, true(3));

% Apply Max filter
maxFiltered = ordfilt2(noisyImage, 9, true(3));

% Display the denoised images
figure;
subplot(2, 2, 1);
imshow(noisyImage);
title('Noisy Image');
subplot(2, 2, 2);
imshow(medianFiltered);
title('Median Filtered');
subplot(2, 2, 3);
imshow(minFiltered);
title('Min Filtered');
subplot(2, 2, 4);
imshow(maxFiltered);
title('Max Filtered');