nx = 32;
ny = 32;
im = imread('../input_data/checkerboard6qi.png');
im1 = imread('../input_data/checkerboard6qi.png');


[m,n] = size(im);
disp([m,n]);
img = im(1:nx:m,1:ny:n);
img2 = imresize(img,[m,n]);

figure;
subplot(2,2,1);
imshow(mat2gray(im));
title('Input Image');

subplot(2,2,2);
imshow(img*255);
title('Sampled Image');

subplot(2,2,3);
imshow(img2*255);
title('Reconstructed Image');

out = fftshift(fft2(img*255));
out = log(abs(out)+1);
out = mat2gray(out);
subplot(2,2,4);
imshow(out);
title('Fourier transformed of sampled image');
