%%
%CHeck structural similarities
clear
clc
addpath scielab


orgImg = imread('landscape.jpeg');
%orgImg = imread('BROADWAY.jpg');
%orgImg = imread('trump.jpg');
%orgImg = imread('sLOTTET.jpg');
%orgImg = imread('landscape.jpeg');

% 1 full database
% 2 100images that depends on orgImgs colors
% 3 200images from colorspectrum


newImg = mainFunction(orgImg,4);

