% Read the input image
input_image = imread('barbara.png');

% Convert the input image to double precision for accurate calculations
input_image = im2double(input_image);

% Define the gamma values
gamma_values = [0.5, 1, 2];

% Apply the gamma transformation for each gamma value
for i = 1:numel(gamma_values)
    gamma = gamma_values(i);
    c = 1;
    
    % Apply the gamma transformation
    gamma_transformed_image = c * (input_image.^gamma);
    
    % Display the transformed image
    figure;
    subplot(1, 2, 1);
    imshow(input_image);
    title('Original Image');
    
    subplot(1, 2, 2);
    imshow(gamma_transformed_image);
    title(['Gamma Transformed Image (\gamma = ' num2str(gamma) ')']);
end
