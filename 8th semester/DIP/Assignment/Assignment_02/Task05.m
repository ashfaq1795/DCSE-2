% Read the input image
input_image = imread('boat.png');

% Convert the input image to double precision for calculations
input_image = im2double(input_image);

% Define the parameters for contrast stretching
r_min = min(input_image(:));
r_max = max(input_image(:));
s_min = 0;
s_max = 1;

% Compute the slope and intercept for the piecewise transformation function
slope = (s_max - s_min) / (r_max - r_min);
intercept = s_min - slope * r_min;

% Apply the piecewise transformation function
output_image = slope * input_image + intercept;

% Display the original and contrast-stretched images
figure;
subplot(1, 2, 1);
imshow(input_image);
title('Original Image');

subplot(1, 2, 2);
imshow(output_image);
title('Contrast-Stretched Image');
