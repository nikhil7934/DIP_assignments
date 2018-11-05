%part-1
inp_colors = [255,0,0;31,73,125;0,176,80;112,48,160;0,0,0;];
img = imread('../input_data/q3_part1.png');

se = strel('arbitrary',[1,1,1;1,1,1;1,1,1;]);
subplot(2,3,1); imshow(img);title('InputImage');
for i =  1:5
    timg = (img(:,:,1) == inp_colors(i,1)) & (img(:,:,2) == inp_colors(i,2)) & (img(:,:,3) == inp_colors(i,3));
    timg = imdilate(timg,se);
    [~,n] = bwlabel(timg);
    subplot(2,3,1+i);imshow(timg);title(strcat('No of Components of Color:' , num2str(n)));   
end

%part-2;

img = rgb2gray(imread('../input_data/q3part2-2.jpg'));
figure;
subplot(2,2,1)
imshow(img);
title('Original Image');

T = adaptthresh(img,0.4,'ForegroundPolarity','dark','Statistic','gaussian');
img = imbinarize(img,T);
se = strel('line',size(img,2)/20,0);
lns = imopen(~img,se);
timg = img;
img = img | lns;
se = strel('disk',2);
img = imopen(img,se);
subplot(2,2,2)
imshow(img);
title('Binarized and filterd Image');
% Classify the characters
inp3 = img;
letters = bwlabel(1-inp3);
empty_spaces = bwlabel(inp3);
[r,c] = size(inp3);
linked = cell(1,size(unique(letters),1));
for i =1:r
    for j=1:c
        if(empty_spaces(i,j)~=1 && empty_spaces(i,j)~=0)
            if(i~=1 && letters(i-1,j)~=0 && letters(i-1,j)~=1)

                linked{letters(i-1,j)} = unique([linked{letters(i-1,j)},empty_spaces(i,j)]);
               
            end
            
        end
        
    end
end

out_letters_1 = zeros(r,c);
out_letters_2 = zeros(r,c);
for i =1:r
    for j=1:c
        if(letters(i,j)~=0)
            [x,y] = size(linked{letters(i,j)});
            if(y==2)

                out_letters_1(i,j) = 1;
                
            elseif(y==3)
                out_letters_2(i,j) = 1;
            else
                out_letters_1(i,j) = 0;
                out_letters_2(i,j) = 0;
            end
           
        end
    end
end
subplot(2,2,3)
imshow(1-out_letters_1,[])
title('Enclosing One empty Region');

subplot(2,2,4)
imshow(1-out_letters_2,[])
title('Enclosing Two empty Region');

inp1 = imbinarize(rgb2gray(imread('../input_data/q3part2-1.jpg')),'adaptive','ForegroundPolarity','dark','Sensitivity',0.4);
inp2 = imbinarize(rgb2gray(imread('../input_data/q3part2-3.jpg')),'adaptive','ForegroundPolarity','dark','Sensitivity',0.567);

img = inp2;
figure;
subplot(2,2,1)
imshow(imread('../input_data/q3part2-3.jpg'))
title('Original Image')

 se = strel('line',1,1);
 inp3 = 1-imdilate(1-img,se);
 subplot(2,2,2)
 imshow(inp3)
 title('Binarized image')
 

letters = bwlabel(1-inp3);
empty_spaces = bwlabel(inp3);
[r,c] = size(inp3);
linked = cell(1,size(unique(letters),1));
for i =1:r
    for j=1:c
        if(empty_spaces(i,j)~=1 && empty_spaces(i,j)~=0)
            if(i~=1 && letters(i-1,j)~=0 && letters(i-1,j)~=1)

                linked{letters(i-1,j)} = unique([linked{letters(i-1,j)},empty_spaces(i,j)]);
               
            end
            
        end
        
    end
end

out_letters_1 = zeros(r,c);
out_letters_2 = zeros(r,c);
for i =1:r
    for j=1:c
        if(letters(i,j)~=0)
            [x,y] = size(linked{letters(i,j)});
            if(y==1)

                out_letters_1(i,j) = 1;
                
            elseif(y==2)
                out_letters_2(i,j) = 1;
            else
                out_letters_1(i,j) = 0;
                out_letters_2(i,j) = 0;
            end
           
        end
    end
end
subplot(2,2,3)
imshow(1-out_letters_1,[])
title('Enclosing One empty Region');

subplot(2,2,4)
imshow(1-out_letters_2,[])
title('Enclosing Two empty Region');
