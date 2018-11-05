function displayBinarizeImages(im)
subplot(2,2,1);
imshow(imread(im));
title('Given Image');
subplot(2,2,2);
imshow(imread(im));
title('Given Image');
subplot(2,2,3);
result = BinarizeImage(im,[0]);
imshow(result);
title('Binarized Image --- Global')
subplot(2,2,4);
result1 = BinarizeImage(im,[1,0.5]);
imshow(result1);
title('Binarized Image --- Locally Adaptive');
end