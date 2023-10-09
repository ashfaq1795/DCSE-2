% Read the input image
input_image = imread('peppers256.png');

% Convert the input image to double precision for accurate calculations
input_image = im2double(input_image);

% Log transformation
c = 0.5; % Scaling constant
log_transformed_image = c * log(input_image + 1);

% Inverse log transformation
inverse_log_transformed_image = exp(log_transformed_image) - 1;

% Display the images
subplot(1, 3, 1);
imshow(input_image);
title('Input Image');

subplot(1, 3, 2);
imshow(log_transformed_image);
title('Log Transformed Image');

subplot(1, 3, 3);
imshow(inverse_log_transformed_image);
title('Inverse Log Transformed Image');
