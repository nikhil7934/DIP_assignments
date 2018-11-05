function result = apply_LS_filter(img_filename,filter)
img = imread(img_filename);

% figure;
% subplot(1,2,1);
% imshow(img);
% title('Orginal Image');

if size(img, 3)>2
    result = cat(3, LSFonImage(img(:,:,1),filter),LSFonImage(img(:,:,2),filter),LSFonImage(img(:,:,3),filter));
%     subplot(1,2,2);
%     imshow(result);
%     title('Filtered Image');

else
    result = LSFonImage(img(:,:),filter);
%     subplot(1,2,2);
%     imshow(result);
%     title('Filtered Image');

end

end