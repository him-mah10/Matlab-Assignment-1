big = imread("Faces.jpg");
subplot(2,2,1);
imshow(big, []);
axis on;
title("Orignal Image");
set(gcf,"units","normalized","outerposition",[0,0,1,1]);

small = imread("F1.jpg");
[rows,columns,numberOfColorBands] = size(small);

subplot(2,2,2);
imshow(small, []);
width = columns;
height = rows;
axis on;
title("Image to find");

channel = 1;
bigbw=rgb2gray(big);
smallbw=rgb2gray(small);
corOutput = normxcorr2(smallbw,bigbw);

[maxValue,maxIndex] = max(abs(corOutput(:)));
[y,x] = ind2sub(size(corOutput),maxIndex(1));

offset = [(x-size(small,2)) , (y-size(small,1)) ];
subplot(2,2,3);
imshow(big, []);
axis on;
hold on;
box = [offset(1) offset(2) width, height];
rectangle('position',box,'edgecolor','r','linewidth',2);
title("Image found here");
