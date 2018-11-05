img = imread('../input_data/color_bars.tif');
img = double(img)/255;
l = size(img,1);
m = size(img,2);
for y=1:l
    for z=1:m
        if img(y,z)<(1/6)
           img(y,z)=0;
        elseif img(y,z)<(2/6)
            img(y,z)=51;
        elseif img(y,z)<(3/6)
            img(y,z)=102;
        elseif img(y,z)<(4/6)
            img(y,z)= 153;
        elseif img(y,z)<(5/6)
            img(y,z) = 204;
        else
            img(y,z) = 255;
        end
    end
end
figure;
imshow(img);