img = imread('../input_data/1.4.08.tiff');

ft1 = abs(fftshift(fft2(img)));
%Range Transformation
ft2 = log(ft1+1);
ft2 = mat2gray(ft2);

figure;
subplot(1,2,1);
imshow(img);
title('Input Image (1.4.08 image from given dataset)');
subplot(1,2,2);
imshow(mat2gray(abs(ft1)),[]);
title('Magnitude of the DFT');

figure;
imshow(ft2);
title('After Log Transformation');
