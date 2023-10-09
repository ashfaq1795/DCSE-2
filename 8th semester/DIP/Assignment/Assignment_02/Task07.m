% Read the grayscale input image
input_image = imread('cameraman.jpg');

% Convert the grayscale image to binary planes
bit_planes = zeros(size(input_image, 1), size(input_image, 2), 8, 'uint8');
for bit = 0:7
    bit_planes(:, :, bit+1) = bitget(input_image, bit+1);
end

% Display the bit-plane images
figure;
for bit = 0:7
    subplot(2, 4, bit+1);
    imshow(bit_planes(:, :, bit+1), []);
    title(['Bit-Plane ', num2str(bit)]);
end
