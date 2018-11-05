function displaydomColors(im, result)

img = imread(im);
k = size(result,1);

subplot(3,1,1);
imshow(img);
title('Input Image');

subplot(3,1,2);
fill([12.5,12.5,17.5,17.5],[2,5,5,2],result(1,:)/255,'LineWidth',1)
axis([0,30,0,5]);
title('Dominat Color');
axis off;

subplot(3,1,3);
h = floor(30/k);
a = 0;
for i=1:k
    if size(result,2) == 3
        rectangle('Position',[a,2,h,3],'FaceColor',result(i,:)./255,'LineWidth', 1);
    else
        rectangle('Position',[a,2,h,3],'FaceColor',[result(i,1)/255,result(i,1)/255,result(i,1)/255],'LineWidth', 1);
    end
    a = a + h;
end
axis([0,30,0,5]);
title('Palette');
axis off;
end