% part-1
img = imread('../input_data/color_bars.tif');
img = double(img)/255;

%RGB
R = img(:,:,1);
G = img(:,:,2);
B = img(:,:,3);
figure;
subplot(1,3,1);
imshow(R);
title('Channel --- R');
subplot(1,3,2);
imshow(G);
title('Channel --- G');
subplot(1,3,3);
imshow(B);
title('Channel --- B');

%CMY
L = ones([size(img,1),size(img,2)]);
C = L-R;
M = L-G;
Y = L-B;
figure;
subplot(1,3,1);
imshow(C);
title('Channel --- C');
subplot(1,3,2);
imshow(M);
title('Channel --- M');
subplot(1,3,3);
imshow(Y);
title('Channel --- Y');

%HSI
numi=1/2*((R-G)+(R-B));
denom=((R-G).^2+((R-B).*(G-B))).^0.5;
H=acosd(numi./(denom+0.000001));
H(B>G)=360-H(B>G);
H=H/360;
S=1- (3./(sum(img,3)+0.000001)).*min(img,[],3);
I=sum(img,3)./3;
figure;
subplot(1,3,1);
imshow(H);
title('Channel --- H');
subplot(1,3,2);
imshow(S);
title('Channel --- S');
subplot(1,3,3);
imshow(I);
title('Channel --- I');

%L*a*b*
lab = rgb2lab(img);
figure;
subplot(1,3,1);
imshow(lab(:,:,1));
title('Channel --- L*');
subplot(1,3,2);
imshow(lab(:,:,2));
title('Channel --- a*');
subplot(1,3,3);
imshow(lab(:,:,3));
title('Channel --- b*');
