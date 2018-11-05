function result = BitQuantizeImage(im, k)
% Take an image and results the image with k-bit instensities values

img = imread(im);
if k >9 && k <=0
    disp('k must be in range [1-8].. Try Again!');
else
    result = double(double(uint8(((double(img)/255)*(2^k - 1))))/(2^k-1));
end
end