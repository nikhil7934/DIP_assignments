function result = q9_3_normal(img, k)

% Median Filter Normal Method.


result = uint8(zeros(size(img)));

str = floor(k/2);

padimg = padarray(img, [str, str]);

[M, N] = size(padimg);
padimg = double(padimg);

for i=1:M-k+1
    for j=1:N-k+1
        tem = padimg(i:i+k-1,j:j+k-1);
        result(i,j) = uint8(median(tem(:)'));     
    end
end

end