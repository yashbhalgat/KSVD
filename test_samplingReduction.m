clean;
I = imread('barbara.png');
figure, imshow(I);

[rows, cols] = size(I);

desample = 5;
J = I(1:desample:rows, 1:desample:cols);

figure, imshow(J);

K = zeros(size(I));
K(1:desample:rows, 1:desample:cols) = I(1:desample:rows, 1:desample:cols);

figure, imshow(K, []);
