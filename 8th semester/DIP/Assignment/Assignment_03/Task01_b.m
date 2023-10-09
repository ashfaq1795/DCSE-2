% Specify the size of the image
imageSize = 255;

% Create a binary image with the desired pattern
image = zeros(imageSize);

% Set the pixels for the upper left corner (white)
image(1:imageSize/2, 1:imageSize/2) = 1;

% Set the pixels for the upper right corner (black)
image(1:imageSize/2, imageSize/2+1:end) = 0;

% Set the pixels for the lower left corner (black)
image(imageSize/2+1:end, 1:imageSize/2) = 0;

% Set the pixels for the lower right corner (white)
image(imageSize/2+1:end, imageSize/2+1:end) = 1;

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
