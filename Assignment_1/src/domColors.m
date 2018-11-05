function result = domColors(im, k)
%Finds the first k frequenctly occuring colors
img = imread(im);

if size(img,3) == 1
    result = zeros(k,1);
    A = reshape(img, [], 1);
    [diff_colors, ~, n] = unique(A, 'rows');
    color_count = accumarray(n, 1);
    for i=1:k
        [~, id] = max(color_count);
        result(i,1) = diff_colors(id,1);
        color_count(id) = 0;
    end
else
    A = reshape(img, [], 3);
    result=zeros(k,3);
    [diff_colors, ~, n] = unique(A, 'rows');
    color_count = accumarray(n, 1);
    for i=1:k
        [~, id] = max(color_count);
        result(i,1) = diff_colors(id,1); 
        result(i,2) = diff_colors(id,2);
        result(i,3) = diff_colors(id,3);
        color_count(id) = 0;
    end
end
end