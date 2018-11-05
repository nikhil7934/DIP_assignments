img = imread('../input_data/1.4.08.tiff');
img1 = log(double(img)+1);
img1 = mat2gray(img1);
figure;
subplot(1,2,1);
imshow(img);
subplot(1,2,2);
imshow(img1);