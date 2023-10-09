% Load the input image
inputImage = imread('house.png');

% Convert the image to grayscale if necessary
if size(inputImage, 3) > 1
    inputImage = rgb2gray(inputImage);
end

% Apply the smoothing filters
order1Image = imfilter(inputImage, ones(3) / 9);
order2Image = imfilter(inputImage, ones(5) / 25);
order3Image = imfilter(inputImage, ones(9) / 81);
order4Image = imfilter(inputImage, ones(15) / 225);

% Display the input and output images
figure;

subplot(2, 3, 1);
imshow(inputImage);
title('Input Image');

subplot(2, 3, 2);
imshow(order1Image);
title('Order 3x3');

subplot(2, 3, 3);
imshow(order2Image);
title('Order 5x5');

subplot(2, 3, 4);
imshow(order3Image);
title('Order 9x9');

subplot(2, 3, 5);
imshow(order4Image);
title('Order 15x15');
