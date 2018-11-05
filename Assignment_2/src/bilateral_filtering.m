function out = bilateral_filtering(img, mask_size, sigma_d, sigma_r)
% Apply the Bilateral Filter with the given parameters 'sigma_d', 'sigma_r'
% 'mask_size', results the output image.


% Domain componenet 
% As it is independent of the Image pixel values we can compute it only
% once and use it anytime in the process.

domfil = zeros([mask_size, mask_size]);
t = 0;
if mod(mask_size, 2) == 1
    t = 1;
end
fg = floor(mask_size/2);
for i=1:mask_size
    for j=1:mask_size
        if t==1
            domfil(i, j) = exp(-((i-fg)^2+(j-fg)^2)/(2*sigma_d*sigma_d));
        else
            domfil(i, j) = exp(-(min(abs(i-fg),abs(i-fg-1)).^2 + min(abs(j-fg),abs(j-fg-1)).^2)/(2*sigma_d*sigma_d));
        end
    end    
end

out  = zeros(size(img));

img = double(img);

[M, N] = size(img);

for i=1:M
    for j=1:N
        imin=max(i-fg,1);
        imax=min(i+fg,M);
        jmin=max(j-fg,1);
        jmax=min(j+fg,N);
        
        tem1 = img(imin:imax, jmin:jmax);
        % range filter
        % As it is dependent on the Image pixel values we should compute
        % here
        
        ranfil1 = exp(-(tem1-img(i,j)).^2/(2*(sigma_r^2)));
        
        finalfil1 = ranfil1.*domfil((imin:imax)-i+fg+1,(jmin:jmax)-j+fg+1);
        
        normalize1 = sum(finalfil1(:));
        
        out(i,j) = sum(sum(finalfil1.*tem1))/normalize1;
    end
end

end