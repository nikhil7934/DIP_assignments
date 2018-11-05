function result = apply_passes(img1)
S1 = [0,0,0;2,1,2;1,1,1];
S2 = [2,0,0;1,1,0;2,1,2];

S190 = [0,2,1;0,1,1;0,2,1];
S290 = [0,0,2;0,1,1;2,1,2];

S1180 = [1,1,1;2,1,2;0,0,0];
S2180 = [2,1,2;0,1,1;0,0,2];

S1270 = [1,2,0;1,1,0;1,2,0];
S2270 = [2,1,2;1,1,0;2,0,0];

% First Pass I1 ---{s1(0)}--- I2

 
l = size(img1,1);
m = size(img1,2);
img2= img1;
img1 = [zeros(1, m); img1; zeros(1,m)];
img1 = [zeros(l+2,1), img1, zeros(l+2,1)];
for i=1:l
    for j=1:m
        ch = 0;
        for g=1:3
            for t=1:3
                if S1(g,t)~=2
                    if S1(g,t) == img1(i+g-1,j+t-1)
                        ch = ch + 1;
                    end
                end
            end
        end
        if ch==7
            img2(i,j) = 0;
        end
    end
end


% Second Pass I2 ---{s2(0)}--- I3
l = size(img2,1);
m = size(img2,2);
img3 = img2;
img2 = [zeros(1,m); img2; zeros(1,m)];
img2 = [zeros(l+2,1), img2, zeros(l+2,1)];
for i=1:l
    for j=1:m
        ch = 0;
        for g=1:3
            for t=1:3
                if S2(g,t) ~= 2
                    if S2(g,t) == img2(i+g-1,j+t-1)
                        ch = ch + 1;
                    end
                end
            end
        end
        if ch==6
            img3(i,j) = 0;
        end
    end
end

% Third Pass I3 ---{s1(90)}--- I4
l = size(img3,1);
m = size(img3,2);
img4 = img3;
img3 = [zeros(1, m); img3; zeros(1,m)];
img3 = [zeros(l+2,1), img3, zeros(l+2,1)];
for i=1:l
    for j=1:m
        ch = 0;
        for g=1:3
            for t=1:3
                if S190(g,t) ~= 2
                    if S190(g,t) == img3(i+g-1,j+t-1)
                        ch = ch + 1;
                    end
                end
            end
        end
        if ch==7
            img4(i,j) = 0;
        end
    end
end


% Fourth Pass I4 ---{s2(90)}--- I5
l = size(img4,1);
m = size(img4,2);
img5 = img4;
img4 = [zeros(1, m); img4; zeros(1,m)];
img4 = [zeros(l+2,1), img4, zeros(l+2,1)];
for i=1:l
    for j=1:m
        ch = 0;
        for g=1:3
            for t=1:3
                if S290(g,t) ~= 2
                    if S290(g,t) == img4(i+g-1,j+t-1)
                        ch = ch + 1;
                    end
                end
            end
        end
        if ch==6
            img5(i,j) = 0;
        end
    end
end


% Fifth Pass I5 ---{s1(180)}--- I6
l = size(img5,1);
m = size(img5,2);
img6 = img5;
img5 = [zeros(1, m); img5; zeros(1,m)];
img5 = [zeros(l+2,1), img5, zeros(l+2,1)];
for i=1:l
    for j=1:m
        ch = 0;
        for g=1:3
            for t=1:3
                if S1180(g,t) ~= 2
                    if S1180(g,t) == img5(i+g-1,j+t-1)
                        ch = ch + 1;
                    end
                end
            end
        end
        if ch==7
            img6(i,j) = 0;
        end
    end
end


% Sixth Pass I6 ---{s2(180)}--- I7
l = size(img6,1);
m = size(img6,2);
img7 = img6;
img6 = [zeros(1, m); img6; zeros(1,m)];
img6 = [zeros(l+2,1), img6, zeros(l+2,1)];
for i=1:l
    for j=1:m
        ch = 0;
        for g=1:3
            for t=1:3
                if S2180(g,t) ~= 2
                    if S2180(g,t) == img6(i+g-1,j+t-1)
                        ch = ch + 1;
                    end
                end
            end
        end
        if ch==6
            img7(i,j) = 0;
        end
    end
end


% Seventh Pass I7 ---{s1(270)}--- I8
l = size(img7,1);
m = size(img7,2);
img8 = img7;
img7 = [zeros(1, m); img7; zeros(1,m)];
img7 = [zeros(l+2,1), img7, zeros(l+2,1)];
for i=1:l
    for j=1:m
        ch = 0;
        for g=1:3
            for t=1:3
                if S1270(g,t) ~= 2
                    if S1270(g,t) == img7(i+g-1,j+t-1)
                        ch = ch + 1;
                    end
                end
            end
        end
        if ch==7
            img8(i,j) = 0;
        end
    end
end


% Eight Pass I8 ---{s2(270)}--- I9
l = size(img8,1);
m = size(img8,2);
img9 = img8;
img8 = [zeros(1, m); img8; zeros(1,m)];
img8 = [zeros(l+2,1), img8, zeros(l+2,1)];
for i=1:l
    for j=1:m
        ch = 0;
        for g=1:3
            for t=1:3
                if S2270(g,t) ~= 2
                    if S2270(g,t) == img8(i+g-1,j+t-1)
                        ch = ch + 1;
                    end
                end
            end
        end
        if ch==6
            img9(i,j) = 0;
        end
    end
end

result = img9;

end