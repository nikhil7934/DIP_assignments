f = imread('../input_data/cameraman.tif');
h = imread('../input_data/grayimagefor4.png');
[rf, cf] = size(f);
disp([rf, cf])
[rh, ch] = size(h);
disp([rh,ch]);

m = size(f,1) + size(f,2) -1;
n = size(h,1) + size(h,2) -1;
fz = zeros([m,n]);
hz = zeros([m,n]);
fz(1:size(f,1),1:size(f,2)) = double(f);
hz(1:size(h,1),1:size(h,2)) = double(h);

f1 = imresize(f, [rf+100, cf+100]);
h1 = imresize(h, [rh+100, ch+100]);
m1 = size(f1,1) + size(f1,2) -1;
n1 = size(h1,1) + size(h1,2) -1;
fz1 = zeros([m1,n1]);
hz1 = zeros([m1,n1]);
fz1(1:size(f1,1),1:size(f1,2)) = double(f1);
hz1(1:size(h1,1),1:size(h1,2)) = double(h1);

f2 = imresize(f, [rf+150, cf+150]);
h2 = imresize(h, [rh+150, ch+150]);
m2 = size(f2,1) + size(f2,2) -1;
n2 = size(h2,1) + size(h2,2) -1;
fz2 = zeros([m2,n2]);
hz2 = zeros([m2,n2]);
fz2(1:size(f2,1),1:size(f2,2)) = double(f2);
hz2(1:size(h2,1),1:size(h2,2)) = double(h2);

f3 = imresize(f, [rf+200, cf+200]);
h3 = imresize(h, [rh+200, ch+200]);
m3 = size(f3,1) + size(f3,2) -1;
n3 = size(h3,1) + size(h3,2) -1;
fz3 = zeros([m3,n3]);
hz3 = zeros([m3,n3]);
fz3(1:size(f3,1),1:size(f3,2)) = double(f3);
hz3(1:size(h3,1),1:size(h3,2)) = double(h3);

ticon = zeros([1,4]);
tiiff = zeros([1,4]);

tic;
conv2(double(f), double(h));
ticon(1,1) = toc;
tic;
ifft2(fft2(fz).*fft2(hz));
tiiff(1,1) = toc;

tic;
conv2(double(f1), double(h1));
ticon(1,2) = toc;
tic;
ifft2(fft2(fz1).*fft2(hz1));
tiiff(1,2) = toc;

tic;
conv2(double(f2), double(h2));
ticon(1,3) = toc;
tic;
ifft2(fft2(fz2).*fft2(hz2));
tiiff(1,3) = toc;

tic;
conv2(double(f3), double(h3));
ticon(1,4) = toc;
tic;
ifft2(fft2(fz3).*fft2(hz3));
tiiff(1,4) = toc;

figure;
plot(ticon, '-ro');hold on;
plot(tiiff, '-bo');
axis on;
ylabel('Time Elasped');
xlabel('Different resolutions of Image');
title('1st([256,256], [200,150]) 2nd([356,356], [300,250]) 3rd([406,406], [350,300]) 4th([456,456], [400,350]) ');
legend('Direct Conv2', 'ifft2(fft2 .* fft2)');