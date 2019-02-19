function [ out_img ] = imgSmaller( in_img,maxCol )
%UNTITLED Summary of this function goes here
%   send in image and maxcolumns, resize it to the size


out_img = imresize(in_img,[NaN maxCol]);

end

