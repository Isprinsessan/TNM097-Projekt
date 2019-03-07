function [ colors ] = getColors( length_in,height_in )
%GETCOLORS Summary of this function goes here
%   Detailed explanation goes here

    lengthPalett = length_in-1;
    palett = im2double(imread('palett.jpg'));
    
    palett = imresize(palett,[height_in,lengthPalett]);
    
    grey = im2double(imread('greySpectrum.jpg'));
    
    grey = imresize(grey,[height_in,length_in-lengthPalett]);
    
    colorspec(:,1) = reshape(palett(:,:,1),1,[]);
    colorspec(:,2) = reshape(palett(:,:,2),1,[]);
    colorspec(:,3) = reshape(palett(:,:,3),1,[]);
    
    greyspec(:,1) = reshape(grey(:,:,1),1,[]);
    greyspec(:,2) = reshape(grey(:,:,2),1,[]);
    greyspec(:,3) = reshape(grey(:,:,3),1,[]);
    max = length_in*height_in;
    colors = zeros([max,3]);
    greycount =1;
    for i = 1:1:(max)
        
       if(i <= length(colorspec(:,1) ))
        
         colors(i,1) = colorspec(i,1);
         colors(i,2) = colorspec(i,2);
         colors(i,3) = colorspec(i,3);
    
       else
           colors(i,1) = greyspec(greycount,1);
           colors(i,2) = greyspec(greycount,2);
           colors(i,3) = greyspec(greycount,3);
           greycount = greycount +1;
           
       end
    end
    
    
    


end