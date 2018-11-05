function q9_1(img_filename, k)

img = imread(img_filename);

filter = ones(k);
filter = filter/(k^2);

lpimage = apply_LS_filter(img_filename, filter);

figure;
subplot(1,2,1);
imshow(img);
title('Orginal Image');
subplot(1,2,2);
imshow(lpimage);
title('After Applied Low Pass Filter');

end