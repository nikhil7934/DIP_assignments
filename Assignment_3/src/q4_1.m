
f = imread('../input_data/rice.png');
h = imread('../input_data/cameraman.tif');
% dft of images
F = fft2(f);
H = fft2(h);
%ifft of mul of images.
mu = ifft2(F.*H);
% convolution...
rt = conv2(double(f),double(h));
gh = rt(128:383, 128:383);
% calculate the differences
fg = sum(sum((mu - gh).^2));
% calculating the average.
fg = fg*(1/(256*256));
disp(fg);