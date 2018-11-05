function [result] = BinarizeImage(im, type)
% Binarize the Image
% Turn the given image to grey-scale
% local thresholding arg(2) is sensitivity parameter for local.
 
img = imread(im);
if size(img, 3) == 3
        img = rgb2gray(img);
end
if type(1) == 0
    level = graythresh(img);
    level = level*255;
    result = (img > level)*255;
elseif type(1) == 1
    T = adaptthresh(img, type(2));
    result = (img/255 >= T)*255;
end
end