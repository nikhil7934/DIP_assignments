% image given.....
img1 = imread('../input_data/q1_image.jpg');
img1 = imbinarize(img1);
img1 = 1-img1;
figure(1);
subplot(1,3,1);
imshow(img1);
out = zeros(size(img1));
while(1)
 if isequal(img1,out)
     break;
 end
 out =img1;
 img1 = apply_passes(img1);
end
subplot(1,3,2);
imshow(img1);