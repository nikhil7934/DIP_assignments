f = imread('../input_data/cameraman.tif');
h = imread('../input_data/rice.png');

m = size(f,1) + size(f,2) -1;
n = size(h,1) + size(f,2) -1;
fz = zeros([m,n]);
hz = zeros([m,n]);
fz(1:size(f,1),1:size(f,2)) = double(f);
hz(1:size(h,1),1:size(h,2)) = double(h);

tic;
tem = ifft2(fft2(fz).*fft2(hz));
we = toc;
disp(we);

m1 = size(f,1) + size(f,2);
n1 = size(h,1) + size(f,2);
fz1 = zeros([m1,n1]);
hz1 = zeros([m1,n1]);
fz1(1:size(f,1),1:size(f,2)) = double(f);
hz1(1:size(h,1),1:size(h,2)) = double(h);

tic;
tem1 = ifft2(fft2(fz1).*fft2(hz1));
we1 = toc;
disp(we1);

disp(min([tem1(512,:) tem1(:,512)']));
disp(max([tem1(512,:) tem1(:,512)']));