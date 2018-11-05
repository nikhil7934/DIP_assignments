
%Q10  part-1

img_filename = './input_data/face.jpg';
img_filename1 = './input_data/face2.jpg';
img = imread(img_filename);
img2 = imread(img_filename1);
result = apply_bilateral_filter(img_filename, 11, 25, 10);
result1 = apply_bilateral_filter(img_filename1, 11, 25, 10);

figure;
subplot(2,2,1);
imshow(img);
title('Orginal Image');

subplot(2,2,2);
imshow(uint8(result));
title('Bilaterally filtered Image');


subplot(2,2,3);
imshow(img2);
title('Orginal Image');

subplot(2,2,4);
imshow(uint8(result1));
title('Bilaterally filtered Image');


% Q10  part-2

img_filename  = './input_data/face2.jpg';
img = imread(img_filename);

result_bl = apply_bilateral_filter(img_filename, 11, 25, 20);

result_hb = highboost_filtering(img_filename, 2);

figure;
subplot(1, 3, 1);
imshow(img);
title('Orginal Image');

subplot(1, 3, 2);
imshow(uint8(result_bl));
title('Bilaterally Filtered');

subplot(1, 3, 3);
imshow(uint8(result_hb));
title('HighBoost Filtered');

% Q10 part-3


img_filename  = './input_data/face2.jpg';
img = imread(img_filename);

figure;
subplot(3,3,1);
result = apply_bilateral_filter(img_filename,9,20,10);
imshow(uint8(result));
title('sigma_r = 10');
ylabel('sigma_d = 20');


subplot(3,3,2);
result = apply_bilateral_filter(img_filename,9,20,20);
imshow(uint8(result));
title('sigma_r = 20');


subplot(3,3,3);
result = apply_bilateral_filter(img_filename,9,20,40);
imshow(uint8(result));
title('sigma_r = 40');


subplot(3,3,4);
result = apply_bilateral_filter(img_filename,9,25,10);
imshow(uint8(result));
ylabel('sigma_d = 25');


subplot(3,3,5);
result = apply_bilateral_filter(img_filename,9,25,20);
imshow(uint8(result));


subplot(3,3,6);
result = apply_bilateral_filter(img_filename,9,25,40);
imshow(uint8(result));


subplot(3,3,7);
result = apply_bilateral_filter(img_filename,9,40,10);
imshow(uint8(result));
ylabel('sigma_d = 40')


subplot(3,3,8);
result = apply_bilateral_filter(img_filename,9,40,20);
imshow(uint8(result));


subplot(3,3,9);
result = apply_bilateral_filter(img_filename,9,40,40);
imshow(uint8(result));

