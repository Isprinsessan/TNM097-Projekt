%%
%CHeck structural similarities

addpath scielab


orgImg = imread('landscape.jpeg');
%orgImg = imread('sLOTTET.jpg');
%orgImg = imread('trump.jpg');
%orgImg = imread('snyggtjej.jpg');

% 1 full database
% 2 100images that depends on orgImgs colors
% 3 200images from colorspectrum

newImg = mainFunction(orgImg,4);

