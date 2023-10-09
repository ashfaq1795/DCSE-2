% Read the input image
input_image = imread('house.png');

% Define the range of gray levels to be highlighted
lower_threshold = 50;
upper_threshold = 150;

% Create a binary mask based on the gray level range
binary_mask = (input_image >= lower_threshold) & (input_image <= upper_threshold);

% Apply the binary mask to the input image to obtain the gray-level sliced image
output_image = input_image;
output_image(~binary_mask) = 0;

% Display the original and gray-level sliced images
figure;
subplot(1, 2, 1);
imshow(input_image);
title('Original Image');

subplot(1, 2, 2);
imshow(output_image);
title('Gray-Level Sliced Image');
