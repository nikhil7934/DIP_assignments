function result = apply_bilateral_filter(img_filename,mask_size, sigma_d, sigma_r)
img = imread(img_filename);

% figure;
% subplot(1,2,1);
% imshow(img);
% title('Orginal Image');

if size(img, 3)>2
    result = cat(3, bilateral_filtering(img(:,:,1),mask_size,sigma_d,sigma_r),bilateral_filtering(img(:,:,2),mask_size,sigma_d,sigma_r),bilateral_filtering(img(:,:,3),mask_size,sigma_d,sigma_r));
%     subplot(1,2,2);
%     imshow(uint8(result));
%     title('Bilaterally filtered Image');

else
    result = bilateral_filtering(img(:,:,1),mask_size,sigma_d,sigma_r);
%     subplot(1,2,2);
%     imshow(uint8(result));
%     title('Bilaterally filtered Image');

end


end