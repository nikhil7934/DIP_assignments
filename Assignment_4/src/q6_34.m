%part-3
img = imread('../input_data/color_bars.tif');
img = double(img)/255;
R = img(:,:,1);
G = img(:,:,2);
B = img(:,:,3);
R1 = histeq(R);
G1 = histeq(G);
B1 = histeq(B);
figure;
imshow(cat(3,R1,G1,B1));

numi=1/2*((R-G)+(R-B));
denom=((R-G).^2+((R-B).*(G-B))).^0.5;
H=acosd(numi./(denom+0.000001));
H(B>G)=360-H(B>G);
H=H/360;
S=1- (3./(sum(img,3)+0.000001)).*min(img,[],3);
I=sum(img,3)./3;

H1=histeq(H);
S1=histeq(S);
I1=histeq(I);
figure;
imshow(cat(3,H1,S1,I1));

%part-4
%(a)
S2 = histeq(S);
I2 = histeq(I);
figure;
imshow(cat(3,H,S2,I2));
%(b)
H3 = histeq(H);
I3 = histeq(I);
figure;
imshow(cat(3,H3,S,I3));
%(c)
I4 = histeq(I);
figure;
imshow(cat(3,H,S,I4));


