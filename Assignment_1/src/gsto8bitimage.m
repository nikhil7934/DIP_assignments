function gsto8bitimage(im)
%Shows the 8bit planes of the given grey scale image
img = imread(im);
img = double(img);
%make arrays for the eight image;

%  Bit-1 Least Significant Bit(LSB)
bitone = mod(img, 2);

%  Bit-2
img = floor(img/2);
bittwo = mod(img, 2);

% Bit-3
img = floor(img/2);
bitthree = mod(img, 2);

% Bit-4
img = floor(img/2);
bitfour = mod(img, 2);

% Bit-5
img = floor(img/2);
bitfive = mod(img, 2);

% Bit-6
img = floor(img/2);
bitsix = mod(img, 2);;

% Bit-7
img = floor(img/2);
bitseven = mod(img, 2);

%Bit-8 Most Siginificant Bit(MSB)
img = floor(img/2);
biteight = mod(img, 2);

subplot(2, 5, 1);

imshow(imread(im));
title('Orginal Image');

subplot(2, 5, 2);

imshow(biteight);
title('Bit-8 Most Significant Bit');

subplot(2, 5, 3);

imshow(bitseven);
title('Bit-7');

subplot(2, 5, 4);

imshow(bitsix);
title('Bit-6');

subplot(2, 5, 5);

imshow(bitfive);
title('Bit-5');

subplot(2, 5, 6);

imshow(bitfour);
title('Bit-4');

subplot(2, 5, 7);

imshow(bitthree);
title('Bit-3');

subplot(2, 5, 8);

imshow(bittwo);
title('Bit-2');

subplot(2, 5, 9);

imshow(bitone);
title('Bit-1 Least Significant Bit');

end