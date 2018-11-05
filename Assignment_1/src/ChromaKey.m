function ChromaKey(fg, bg, keyColor)
imfg = imread(fg);
imbg = imread(bg);
imbg = imresize(imbg, [size(imfg,1),size(imfg,2)]);

R = keyColor(1);                   
G = keyColor(2);               
B = keyColor(3);

imF = (imfg(:,:,1)-R<15)&(imfg(:,:,2)-G<15)&(imfg(:,:,3)-B<15);


imFu = cast(~imF,'uint8');

imFm = cast(imF,'uint8');

imCk(:,:,1) = imbg(:,:,1).*imFm + imFu.*imfg(:,:,1);

imCk(:,:,2) = imbg(:,:,2).*imFm + imFu.*imfg(:,:,2);

imCk(:,:,3) = imbg(:,:,3).*imFm + imFu.*imfg(:,:,3);

subplot(1,3,1);
imshow(bg);
subplot(1,3,2);
imshow(fg);
subplot(1,3,3);
imshow(imCk);

end