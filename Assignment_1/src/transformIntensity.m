function result = transformIntensity(im, K1, K2, a, b)
img =  imread(im);
[m, n, c] = size(img);
for p = 1:c
    for i=1:m
        for j=1:n
            rt = img(i,j,p);
            for u = 1:size(K1)
                if rt>=a(u) && rt <=b(u)
                    img(i,j,p) = K1(u)*img(i,j,p) + K2(u);
                end
            end
        end
    end
end
result = img;
figure;
subplot(1,2,1);
imshow(imread(im));
title('Input Image');
subplot(1,2,2);
imshow(img);
title('Transformed Image');
end