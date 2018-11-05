function myHistMatching(im1, im2)
img1 = imread(im1);
img2 = imread(im2);

result = img1;

pdfimg1 = myHistogram(im1);
pdfimg2 = myHistogram(im2);

for p=1:size(pdfimg1,3)
    M = zeros(256,1,'uint8');
    cdf1 = cumsum(pdfimg1(:,:,p)) ./ numel(img1);
    cdf2 = cumsum(pdfimg2(:,:,p)) ./ numel(img2);
    for i=1:256
        diff = abs(cdf1(i)-cdf2);
        [~, ind] = min(diff);
        M(i) = ind - 1;
    end
    result(:,:,p) = M(img1(:,:,p)+1);
end
imwrite(result,'Q5c_hist_matching.jpg','jpg');
pdfimg3 = myHistogram('Q5c_hist_matching.jpg');




close all;
figure;
subplot(2,3,1);
imshow(img1);
title(strcat(im1,'--Input Image'));
subplot(2,3,4);
if size(img1, 3) == 3
    xax = 0:1:255;
    area(xax,pdfimg1(:,:,1)./(size(img1,1)*size(img1,2)),'Facecolor','r','FaceAlpha',0.4);hold on;
    area(xax,pdfimg1(:,:,2)./(size(img1,1)*size(img1,2)),'Facecolor','g','FaceAlpha',0.4);hold on;
    area(xax,pdfimg1(:,:,3)./(size(img1,1)*size(img1,2)),'Facecolor','b','FaceAlpha',0.4);hold on;
    axis on;
else
    xax = 0:1:255;
    area(xax,pdfimg1(:,:,1)./(size(img1,1)*size(img1,2)),'Facecolor','m','FaceAlpha',0.4);hold on;
    axis on;
end
title('Histogram');

subplot(2,3,2);
imshow(img2);
title(strcat(im2,'--Reference Image'));
subplot(2,3,5);
if size(img1, 3) == 3
    xax = 0:1:255;
    area(xax,pdfimg2(:,:,1)./(size(img2,1)*size(img2,2)),'Facecolor','r','FaceAlpha',0.4);hold on;
    area(xax,pdfimg2(:,:,2)./(size(img2,1)*size(img2,2)),'Facecolor','g','FaceAlpha',0.4);hold on;
    area(xax,pdfimg2(:,:,3)./(size(img2,1)*size(img2,2)),'Facecolor','b','FaceAlpha',0.4);hold on;
    axis on;
else
    xax = 0:1:255;
    area(xax,pdfimg2(:,:,1)./(size(img2,1)*size(img2,2)),'Facecolor','m','FaceAlpha',0.4);hold on;
    axis on;
end
title('Histogram');

subplot(2,3,3);
imshow(result);

title(strcat(im1,' is matched with ', im2));
subplot(2,3,6);

if size(img1, 3) == 3
    xax = 0:1:255;
    area(xax,pdfimg3(:,:,1)./(size(img1,1)*size(img1,2)),'Facecolor','r','FaceAlpha',0.4);hold on;
    area(xax,pdfimg3(:,:,2)./(size(img1,1)*size(img1,2)),'Facecolor','g','FaceAlpha',0.4);hold on;
    area(xax,pdfimg3(:,:,3)./(size(img1,1)*size(img1,2)),'Facecolor','b','FaceAlpha',0.4);hold on;
    axis on;
else
    xax = 0:1:255;
    area(xax,pdfimg3(:,:,1)./(size(img1,1)*size(img1,2)),'Facecolor','m','FaceAlpha',0.4);hold on;
    axis on;
end
title('Histogram');

end
