function [ img ] = data2img( data )
%UNTITLED4 Summary of this function goes here
%  send in one 4d ( :,:,3,1) get one image (:,:,3);

[orgHeight,orgWidth,chn] = size(data)
img = zeros(orgHeight,orgWidth,3);
img(:,:,1) = data(:,:,1,1);
img(:,:,2) = data(:,:,2,1);
img(:,:,3) = data(:,:,3,1);


end

