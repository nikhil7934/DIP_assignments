result = myHistEqual('hist_equal.jpg');
J = imread('hist_equal.jpg');
J = cat(3, histeq(J(:,:,1)), histeq(J(:,:,2)), histeq(J(:,:,3)));
figure;
subplot(1,3,1);
imshow('hist_equal.jpg');
title('Input Image');
subplot(1,3,2);
imshow(result);
title('My Function');
subplot(1,3,3);
imshow(J);
title('Inbuilt Function');
