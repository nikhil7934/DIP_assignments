function q4(img_filepath)
% given operators

prewittx = [-1, 0, 1; -1, 0, 1; -1, 0, 1];
prewitty = [1, 1, 1; 0, 0, 0; -1, -1, -1];

sobelx = [-1, 0, 1; -2, 0, 2; -1, 0, 1];
sobely = [1, 2, 1; 0, 0, 0; -1, -2, -1];

robertsx = [0, 1; -1, 0];
robertsy = [1, 0; 0, -1];

laplacian = [0, -1, 0; -1, 4, -1; 0, -1, 0];
laplacian_dia = [-1, -1, -1; -1, 8, -1; -1, -1, -1];

b  = imread(img_filepath);
barbara = img_filepath;
% applying prewitt operator...

px = apply_LS_filter(barbara, prewittx);
py = apply_LS_filter(barbara, prewitty);

pfinal = sqrt(double(px).^2 +  double(py).^2);

figure;
subplot(2,2,1);
imshow(b);
title('Orginal Image');
subplot(2,2,2);
imshow(uint8(pfinal));
title('Result of Prewitt');
subplot(2,2,3);
imshow(px);
title('In Horizontal Direction');
subplot(2,2,4);
imshow(py);
title('In Vertical Direction');

% applying sobel operator...

sx = apply_LS_filter(barbara, sobelx);
sy = apply_LS_filter(barbara, sobely);

sfinal = sqrt(double(sx).^2 +  double(sy).^2);

figure;
subplot(2,2,1);
imshow(b);
title('Orginal Image');
subplot(2,2,2);
imshow(uint8(sfinal));
title('Result of Sobel');
subplot(2,2,3);
imshow(sx);
title('In Horizontal Direction');
subplot(2,2,4);
imshow(sy);
title('In Vertical Direction');

% applying roberts operator....


rx = apply_LS_filter(barbara, robertsx);
ry = apply_LS_filter(barbara, robertsy);

rfinal = sqrt(double(rx).^2 + double(ry).^2);

figure;
subplot(2,2,1);
imshow(b);
title('Orginal Image');
subplot(2,2,2);
imshow(uint8(rfinal));
title('Result of Roberts');
subplot(2,2,3);
imshow(rx);
title('In Horizontal Direction');
subplot(2,2,4);
imshow(ry);
title('In Vertical Direction');

% applying laplacian without diagonals

l = apply_LS_filter(barbara, laplacian);

figure;
subplot(1,2,1);
imshow(b);
title('Orginal Image');
subplot(1,2,2);
imshow(l);
title('Result of Laplacian without diagonals');

% applying laplacian with diagonals

ld = apply_LS_filter(barbara, laplacian_dia);

figure;
subplot(1,2,1);
imshow(b);
title('Orginal Image');
subplot(1,2,2);
imshow(ld);
title('Result of Laplacian include diagonals');

end