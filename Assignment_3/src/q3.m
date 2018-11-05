img = imread('../input_data/laura.gif');

img1= zeros([128,128]);
img1(1:64, 1:64) = img(:,:);
img1(65:128, 65:128) = 0;

img2= zeros([256,256]);
img2(1:64, 1:64) = img(:,:);
img2(65:256,65:256) = 0;

img3= zeros([512,512]);
img3(1:64, 1:64) = img(:,:);
img3(65:512,65:512) = 0;

figure;
subplot(1,2,1);
imshow(img,[]);
subplot(1,2,2);
imshow(mat2gray(log(abs(fftshift(fft2(img))))));

figure;
subplot(1,2,1);
imshow(mat2gray(img1),[]);
subplot(1,2,2);
imshow(mat2gray(log(abs(fftshift(fft2(img1))))));

figure;
subplot(1,2,1);
imshow(mat2gray(img2),[]);
subplot(1,2,2);
imshow(mat2gray(log(abs(fftshift(fft2(img2))))));

figure;
subplot(1,2,1);
imshow(mat2gray(img3),[]);
subplot(1,2,2);
imshow(mat2gray(log(abs(fftshift(fft2(img3))))));
