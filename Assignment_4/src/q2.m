img = imread('../input_data/q2_image.jpg');
img = imbinarize(img);
[centers, ~, ~] = imfindcircles(img,[5 25]);
centers = round(centers);
dim = size(centers);
L1 = (zeros(size(img)));
imagebound = (zeros(size(img)));
for x = 1:dim(1)
    imagebound(centers(x,2), centers(x,1)) = true;
end
componentstruct = bwconncomp(img, 4);
for comp = 1:componentstruct.NumObjects
    comparecomp = zeros(1,2);
    ic = cell2mat(componentstruct.PixelIdxList(comp));
    ct = 0;
    dim1 = size(ic);
    for k = 1:dim1(1)
        [i,j] = ind2sub(size(img), ic(k));
        if imagebound(i,j)
            ct = ct+1;
            if ct < 2 && ct > 0
                comparecomp(ct,1) = i;
                comparecomp(ct,2) = j;
            end
        end
    end
    if ct == 1
        L1(comparecomp(1,1), comparecomp(1,2)) = 1;
    end
end
cb = imagebound;
cb(13:size(imagebound,1)-13,13:size(imagebound,2)-13) = 0;
cointouchboundary = imdilate(cb,strel('disk', 11, 0));
nonoverlap = imdilate(L1,strel('disk', 11, 0));
sc1 = [1,1,1;1,1,1;1,1,1];
img2 = xor(img, nonoverlap);
overlap = imopen(img2, sc1);
figure;
subplot(1,2,1);
imshow(img);
title('Input Image');
subplot(1,2,2);
imshow(cointouchboundary);
title('Coins overlap Boundary image');
figure;
subplot(1,2,1);
imshow(img);
title('Input Image');
subplot(1,2,2);
imshow(nonoverlap);
title('Non-overlapping coins');
figure;
subplot(1,2,1);
imshow(img);
title('Input Image');
subplot(1,2,2)
imshow(overlap);
title('Overlapping coins');