% Load the image
grayImage = imread('lena.png');

% Create the modified versions of the image
darkImage = imadjust(grayImage, [], [], 2);
brightImage = imadjust(grayImage, [], [], 0.088);
lowContrastImage = imadjust(grayImage, [], [], 1);
highContrastImage = imadjust(grayImage, [], [], 2.5);

% Calculate the histograms of the modified images
darkHistogram = imhist(darkImage);
brightHistogram = imhist(brightImage);
lowContrastHistogram = imhist(lowContrastImage);
highContrastHistogram = imhist(highContrastImage);

% Plot the histograms
figure;

subplot(2, 2, 1);
bar(darkHistogram);
title('Dark Image Histogram');
xlabel('Intensity');
ylabel('Frequency');

subplot(2, 2, 2);
bar(brightHistogram);
title('Bright Image Histogram');
xlabel('Intensity');
ylabel('Frequency');

subplot(2, 2, 3);
bar(lowContrastHistogram);
title('Low Contrast Image Histogram');
xlabel('Intensity');
ylabel('Frequency');

subplot(2, 2, 4);
bar(highContrastHistogram);
title('High Contrast Image Histogram');
xlabel('Intensity');
ylabel('Frequency');
