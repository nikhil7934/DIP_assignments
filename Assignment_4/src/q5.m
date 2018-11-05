%part-1
multi = cell(10,1);
cnt=1;
for i=60:11:150
    tm = ones(100,100,3);
    tm(:,:,1) = i.*tm(:,:,1);
    imgre = hsi_to_rgb(tm);
    multi{cnt} = imgre;
    cnt = cnt + 1;
end
montage(multi, 'Size',[1 10]);
%part-2
img = zeros(100,100,3);
fl=0;
multi=cell(12,1);
ind = 1;
for i=0.33:0.03:0.67
    out = img;
    img(:,:,1) = i*ones(100,100);
    img(:,:,2) = ones(100,100);
    img(:,:,3) = ones(100,100);
    img = hsv2rgb(img);
    multi{ind} = img;
    ind = ind+1;
end
montage(multi, 'Size',[1 12]);