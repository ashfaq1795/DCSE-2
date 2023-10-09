% Specify the size of the image
imageSize = 255;

% Calculate the number of pixels for each portion (white and black)
numPixels = floor(imageSize^2 / 2);

% Create a binary image with equal portions of white and black
image = ones(imageSize);

% Set the pixels for the white portion
image(1:numPixels) = 0;

% Convert the image to grayscale
grayImage = uint8(image * 255);

% Display the grayscale image
imshow(grayImage);

% Compute the histogram of gray-level values
histValues = imhist(grayImage);

% Plot the histogram
figure;
bar(histValues, 'FaceColor', 'b', 'EdgeColor', 'none');
title('Histogram of Gray-Level Values');
xlabel('Gray-Level Value');
ylabel('Frequency');
