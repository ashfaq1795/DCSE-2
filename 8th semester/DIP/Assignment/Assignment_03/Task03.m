% Load the low-contrast image
lowContrastImage = imread('house.png');

% Compute the histogram of the input image
inputHistogram = imhist(lowContrastImage);

% Define the desired histogram (specification)
desiredHistogram = linspace(0, 255, 256);

% Perform histogram specification
outputImage = histeq(lowContrastImage, desiredHistogram);

% Compute the histogram of the output image
outputHistogram = imhist(outputImage);

% Plot the histograms
figure;

subplot(2, 1, 1);
bar(inputHistogram);
title('Input Image Histogram');
xlabel('Intensity');
ylabel('Frequency');

subplot(2, 1, 2);
bar(outputHistogram);
title('Output Image Histogram');
xlabel('Intensity');
ylabel('Frequency');
