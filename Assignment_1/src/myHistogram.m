function result = myHistogram(im)
% Plot the Histogram of the given Image
img = imread(im);
if size(img, 3) == 1
    totalpixels = size(img,1)*size(img,2);
    subplot(2,1,1);
    imshow(img);
    title('Image')
    
    subplot(2,1,2);
    fre = zeros(256, 1);
    for i=1:size(img,1)
        for j=1:size(img,2)
            fre(img(i,j)+1,1) = fre(img(i,j)+1,1) + 1;
        end
    end
    fren = fre./totalpixels;
    result = fre;
    xax = 0:1:255;
    area(xax, fren, 'Facecolor','m', 'FaceAlpha', 0.4)
    axis on;
else
    totalpixels = size(img,1)*size(img,2);
    subplot(2,1,1);
    imshow(img);
    title('Image')
    
    subplot(2,1,2);
    Rfre = zeros(256, 1);
    Gfre = zeros(256, 1);
    Bfre = zeros(256, 1);
    
    for i=1:size(img,1)
        for j=1:size(img,2)
            Rfre(img(i,j,1)+1,1) = Rfre(img(i,j,1)+1,1) + 1;
            Gfre(img(i,j,2)+1,1) = Gfre(img(i,j,2)+1,1) + 1;
            Bfre(img(i,j,3)+1,1) = Bfre(img(i,j,3)+1,1) + 1;
        end
    end
    Rfren = Rfre./totalpixels;
    Gfren = Gfre./totalpixels;
    Bfren = Bfre./totalpixels;
    Rfg = max(Rfre);
    Gfg = max(Gfre);
    Bfg = max(Bfre);
    xax = 0:1:255;
    result = cat(3, Rfre, Gfre, Bfre);
    area(xax,Rfren,'Facecolor','r','FaceAlpha',0.4);hold on;
    area(xax,Gfren,'Facecolor','g','FaceAlpha',0.4);hold on;
    area(xax,Bfren,'Facecolor','b','FaceAlpha',0.4);hold on;
    axis on;
end
end