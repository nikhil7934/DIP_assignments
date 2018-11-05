
img = imread('../input_data/cameraman.tif');

ft2 = (fft2((fft2(img),180)));

ft2 = mat2gray(abs(ft2));

figure;
subplot(1,2,1);
imshow(img);
subplot(1,2,2);
imshow(ft2);

% We can easily fix problem 
% by doing 

% ft2 = fft2(imrotate(fft2(img),180));