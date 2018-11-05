function result = q9_2(img, k)

filter = ones(k)/(k^2);

[m, n] = size(filter);

result = uint8(zeros(size(img)));

stc = floor(n/2);
str = floor(m/2);

padimg = padarray(img, [str, stc]);

[M, N] = size(padimg);
padimg = double(padimg);


result(1, 1) = uint8((sum(sum(padimg(1:m,1:n).*filter))));

total1 = result(1, 1);

for i=1:M-m+1
    
    total2 = total1;
    for j=2:N-n+1
        
        tem1 = padimg(i:i+m-1 , j-1).*filter( : , 1 );
        total2 = total2 - sum(tem1(:));
        tem2 = padimg(i:i+m-1 , j+n-1).*filter( : , n);
        total2 = total2 + sum(tem2(:));
        
        result(i, j) = uint8(total2);
%       result(i,j) = uint8((sum(sum(padimg(i:i+m-1,j:j+n-1).*filter))));     
    
    end
    
    if i~=M-m+1
        tem1 = padimg(i , 1:n).*filter( 1 , :);
        total1 = total1 - sum(tem1(:));
        tem2 = padimg(i+m ,1:n).*filter( m , :);
        total1 = total1 + sum(tem2(:));
        result(i+1, 1) = uint8(total1);
    end
end

end