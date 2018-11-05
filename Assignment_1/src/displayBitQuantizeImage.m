function displayBitQuantizeImage(im)
for i=1:8
    subplot(2,4,i);
    result = BitQuantizeImage(im, i); 
    imshow(result);
    title(strcat( num2str(i),'-Bit'));
end
end