% Read the input image
gray_image = imread('lena.png');

% Check bit depth
info = imfinfo('lena.png');
bit_depth = info.BitDepth;
disp(['Bit Depth: ' num2str(bit_depth)]);


% As the imgae is 8-bits Compute the maximum intensity value (L-1)
L = 256; 
max_intensity = L - 1;

% Perform the negative transformation
negative_image = max_intensity - gray_image;

% Display the original and negative transformed images
subplot(1, 2, 1);
imshow(gray_image);
title('Original Image');
subplot(1, 2, 2);
imshow(negative_image);
title('Negative Transformed Image');


