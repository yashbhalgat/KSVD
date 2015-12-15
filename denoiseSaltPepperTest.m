clean;
bb=8; % block size
RR=4; % redundancy factor
K=RR*bb^2; % number of atoms in the dictionary

% sigma = 25*6; 
% ?pathForImages =''
imageName = 'barbara.png';
[IMin0,pp]=imread(imageName);

IMin0=im2double(IMin0);
% if (length(size(IMin0))>2)
%     IMin0 = rgb2gray(IMin0);
% end
% if (max(IMin0(:))<2)
%     IMin0 = IMin0*255;
% end

N = 10;
IMin = zeros(size(IMin0));
avgNoise = zeros(size(IMin0));
for i = 1:N
    IMin = imnoise(IMin0, 'salt & pepper');
    avgNoise = avgNoise + imnoise(IMin0, 'salt & pepper');
    if i == 1
        IMin1 = IMin;
        avgNoise1 = avgNoise;
    end
end

figure (1)
subplot(2,3,1), imshow(IMin0,[])
subplot(2,3,2), imshow(IMin1,[])
subplot(2,3,3), imshow(IMin/N,[])
subplot(2,3,5), imshow(avgNoise1)
subplot(2,3,6), imshow(avgNoise/N)
