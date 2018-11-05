function result = LSFonImage(img,filter)

% Apply the given filter on Image and outputs the resultant Image
% PADDING need to be done.

[m, n] = size(filter);

result = uint8(zeros(size(img)));

stc = floor(n/2);
str = floor(m/2);

padimg = padarray(img, [str, stc]);

[M, N] = size(padimg);
padimg = double(padimg);

for i=1:M-m+1
    for j=1:N-n+1
        result(i,j) = uint8((sum(sum(padimg(i:i+m-1,j:j+n-1).*filter))));     
    end
end

end