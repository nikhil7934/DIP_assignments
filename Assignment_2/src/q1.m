
sky = imread('./input_data/sky.jpeg');
sky2 = imread('./input_data/sky2.jpg');

A = [1, 2, 1; 2, 4, 2; 1, 2, 1];
A = A/16;

B = [1, 4, 6, 4, 1; 4, 16, 24, 16, 4; 6, 24, 36,24, 6; 4, 16, 24, 16, 4; 1, 4, 6, 4, 1];
B = B/256;

C = [-1, 0, 1; -2, 0, 2; -1, 0, 1];
C = C/8;

skyA = apply_LS_filter('./input_data/sky.jpeg', A);
skyB = apply_LS_filter('./input_data/sky.jpeg', B);
skyC = apply_LS_filter('./input_data/sky.jpeg', C);

sky2A = apply_LS_filter('./input_data/sky2.jpg', A);
sky2B = apply_LS_filter('./input_data/sky2.jpg', B);
sky2C = apply_LS_filter('./input_data/sky2.jpg', C);


A1 = [1, 2, 1; 0, 4, 0; 1, 2, 1]; 
A1 = A1/16;
skyA1 = apply_LS_filter('./input_data/sky.jpeg', A1);
sky2A1 = apply_LS_filter('./input_data/sky2.jpg', A1);


A2 = [0, 2, 0;0, 4, 0; 0, 2, 0 ];
A2 = A2/16;
skyA2 = apply_LS_filter('./input_data/sky.jpeg', A2);
sky2A2 = apply_LS_filter('./input_data/sky2.jpg', A2);


B1 = [2, 1, 1, 1, 2; 2, 4, 6, 4, 2; 6, 8, 36,8, 6; 2, 4, 6, 4, 2; 2, 1, 1, 1, 2];
B1 = B1/256;
skyB1 = apply_LS_filter('./input_data/sky.jpeg', B1);
sky2B1 = apply_LS_filter('./input_data/sky2.jpg', B1);


B2 = [1, 4, 4, 4, 1; 4, 4, 16, 4, 4; 4, 16, 36,16, 4; 4, 4, 16, 4, 4; 1, 4, 4, 4, 1];
B2 = B2/256;
skyB2 = apply_LS_filter('./input_data/sky.jpeg', B2);
sky2B2 = apply_LS_filter('./input_data/sky2.jpg', B2);

C1 = [-1, 0 ,1; 2, 0, 2; -1, 0, 1];
C1 = C1/8;
skyC1 = apply_LS_filter('./input_data/sky.jpeg', C1);
sky2C1 = apply_LS_filter('./input_data/sky2.jpg', C1);

C2 = [-1, 0, 1; 0, 2, 0; -1, 0, 1];
C2 = C2/8;
skyC2 = apply_LS_filter('./input_data/sky.jpeg', C2);
sky2C2 = apply_LS_filter('./input_data/sky2.jpg', C2);

% for Image sky.jpeg with A, A1, A2
figure;
subplot(2, 2, 1);
imshow(sky);
title('Orginal Image');
subplot(2, 2, 2);
imshow(skyA);
title('Filtered With filter A');
subplot(2, 2, 3);
imshow(skyA1);
title('Filtered With filter A1');
subplot(2, 2, 4);
imshow(skyA2);
title('Filtered With filter A2');

% for Image sky2.jpg with A, A1, A2
figure;
subplot(2, 2, 1);
imshow(sky2);
title('Orginal Image');
subplot(2, 2, 2);
imshow(sky2A);
title('Filtered With filter A');
subplot(2, 2, 3);
imshow(sky2A1);
title('Filtered With filter A1');
subplot(2, 2, 4);
imshow(sky2A2);
title('Filtered With filter A2');

% for Image sky.jpeg with B, B1, B2
figure;
subplot(2, 2, 1);
imshow(sky);
title('Orginal Image');
subplot(2, 2, 2);
imshow(skyB);
title('Filtered With filter B');
subplot(2, 2, 3);
imshow(skyB1);
title('Filtered With filter B1');
subplot(2, 2, 4);
imshow(skyB2);
title('Filtered With filter B2');

% for Image sky2.jpg with B, B1, B2
figure;
subplot(2, 2, 1);
imshow(sky2);
title('Orginal Image');
subplot(2, 2, 2);
imshow(sky2B);
title('Filtered With filter B');
subplot(2, 2, 3);
imshow(sky2B1);
title('Filtered With filter B1');
subplot(2, 2, 4);
imshow(sky2B2);
title('Filtered With filter B2');



% for Image sky.jpeg with C, C1, C2
figure;
subplot(2, 2, 1);
imshow(sky);
title('Orginal Image');
subplot(2, 2, 2);
imshow(skyC);
title('Filtered With filter C');
subplot(2, 2, 3);
imshow(skyC1);
title('Filtered With filter C1');
subplot(2, 2, 4);
imshow(skyC2);
title('Filtered With filter C2');

% for Image sky2.jpg with C, C1, C2
figure;
subplot(2, 2, 1);
imshow(sky2);
title('Orginal Image');
subplot(2, 2, 2);
imshow(sky2C);
title('Filtered With filter C');
subplot(2, 2, 3);
imshow(sky2C1);
title('Filtered With filter C1');
subplot(2, 2, 4);
imshow(sky2C2);
title('Filtered With filter C2');

