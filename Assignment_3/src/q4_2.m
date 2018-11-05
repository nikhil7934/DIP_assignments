% verification of convolution theorum..
f = imread('../input_data/cameraman.tif');
h = imread('../input_data/grayimagefor4.png');

disp(size(f));
disp(size(h));

c = conv2(double(f),double(h));
d = fft2(c);
[m, n] = size(d);

fz = zeros([m,n]);
hz = zeros([m,n]);

fz(1:size(f,1), 1:size(f,2)) = double(f);
hz(1:size(h,1), 1:size(h,2)) = double(h);

Fz = fft2(fz);
Hz = fft2(hz);

e = Fz.*Hz;

dif = sum(sum((abs(e - d)).^2));
dif = dif*(1/(m*n));
disp(dif);

