function result = myLocalHistEqual(im, window)
% Performs local histogram Equalization on the given Image
img = imread(im);
subplot(1,2,1);
imshow(im);
title('Input Image')
result = img;
if size(img,3) == 1
    s1 = size(img, 1);
    s2 = size(img, 2);
    ty = floor(window/2);
    for i=1:s1
        for j=1:s2
            fg = zeros(256, 1);
            xs = max(1, i - ty);
            xe = min(s1, i + ty);
            ys = max(1, j - ty);
            ye = min(s2, j + ty);
            for p=xs:xe
                for q=ys:ye
                    fg(img(p,q)+1,1) = fg(img(p,q)+1) + 1;
                end
            end
            result(i,j) = floor((sum(fg(1:(img(i,j)+1),1))/(window*window))*255);
        end
    end
    subplot(1,2,2);
    imshow(result);
    title(strcat('LocalHistEqual with WindowSize:', num2str(winsdow)));
else
    s1 = size(img, 1);
    s2 = size(img, 2);
    ty = floor(window/2);
    for i=1:s1
        for j=1:s2
            rfg = zeros(256, 1);
            gfg = zeros(256, 1);
            bfg = zeros(256, 1);
            xs = max(1, i - ty);
            xe = min(s1, i + ty);
            ys = max(1, j - ty);
            ye = min(s2, j + ty);
            for p=xs:xe
                for q=ys:ye
                    rfg(img(p,q,1)+1,1) = rfg(img(p,q,1)+1,1) + 1;
                    gfg(img(p,q,2)+1,1) = gfg(img(p,q,2)+1,1) + 1;
                    bfg(img(p,q,3)+1,1) = bfg(img(p,q,3)+1,1) + 1;
                end
            end
            result(i,j,1) = floor((sum(rfg(1:(img(i,j,1)+1),1))/(window*window))*255);
            result(i,j,2) = floor((sum(gfg(1:(img(i,j,2)+1),1))/(window*window))*255);
            result(i,j,3) = floor((sum(bfg(1:(img(i,j,3)+1),1))/(window*window))*255);
        end
    end
    
    subplot(1,2,2);
    imshow(result);
    title(strcat('LocalHistEqual with WindowSize:', num2str(window)));
end
end