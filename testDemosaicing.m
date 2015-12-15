I = imread('barbara.png');
J = demosaic(I,'bggr');
imshow(I);
figure, imshow(J);