function [result, hist] = myHistEqual(im)
img = imread(im);
if size(img, 3) == 1
    totalpixels = size(img,1)*size(img,2);
    subplot(1,2,1);
    imshow(img);
    title('Input-Image')
    
    subplot(1,2,2);
    fre = zeros(256, 1);
    for i=1:size(img,1)
        for j=1:size(img,2)
            fre(img(i,j)+1,1) = fre(img(i,j)+1,1) + 1;
        end
    end
    fren = fre./totalpixels;
    
    eros = zeros(size(img));
    for i=1:size(img,1)
        for j=1:size(img,2)
            eros(i,j) = sum(fre(1:(img(i,j)+1),1))/totalpixels;
        end
    end
    result = eros;
    hist = fre;
    imshow(eros);
    title('My-HistEqualFunction');
    
else
    totalpixels = size(img,1)*size(img,2);
    subplot(1,2,1);
    imshow(img);
    title('Input-Image')
    
    subplot(1,2,2);
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
    erosr = zeros(size(img(:,:,1)));
    erosg = zeros(size(img(:,:,2)));
    erosb = zeros(size(img(:,:,3)));
    
    for i=1:size(img,1)
        for j=1:size(img,2)
            erosr(i,j) = sum(Rfre(1:(img(i,j,1)+1),1))/totalpixels;
            erosg(i,j) = sum(Gfre(1:(img(i,j,2)+1),1))/totalpixels;
            erosb(i,j) = sum(Bfre(1:(img(i,j,3)+1),1))/totalpixels;
        end
    end
    result = cat(3, erosr, erosg, erosb);
    imshow(result);
    title('My HistEqual Function');
    
end
end