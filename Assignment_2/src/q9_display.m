

img_filename = './input_data/cameraman.tif'; 
img = imread('./input_data/cameraman.tif');

k = 2:3:10;
time = zeros(size(k));
time2 = zeros(size(k));
ind = 1;
for i=k
    tic;
    q9_1(img_filename,i);
    aft = toc();
    time(ind) = aft;
    
    tic;
    q9_2(img,i);
    aft = toc();
    time2(ind) = aft;
    ind = ind+1;
end
figure;
plot(k,time,'r-');
hold on;
plot(k,time2,'b--');
title('For Low-Pass Filter');
axis auto;