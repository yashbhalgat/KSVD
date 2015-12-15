I = imread('barbara.png');
J = imnoise(I,'gaussian', 0, 0.01);
J = imnoise(J,'salt & pepper',0.02);
K = medfilt2(J);
figure
subplot(1,3,1), imshow(I)
subplot(1,3,2), imshow(J)
subplot(1,3,3), imshow(K)