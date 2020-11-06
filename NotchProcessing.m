clc;
clear;
close all;
f = imread("sourceImage.jpg");
figure, imshow(f, []); 
%This command show our first image before any
%editing getting placed
F = fftshift(fft2(double(f)));
S = log(abs(F));
imwrite( S/max(S(:)), 'maskSource.jpg');

pause;

M = imread('maskSource.jpg');
M = M(:,:,1);
M = double((M>0));
figure, imshow(M);

G = M .* F;
g = real(ifft2(ifftshift(G)));

figure, imshow(g,[]);
