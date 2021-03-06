function [ colors ] = getColors( length_in,height_in )
%GETCOLORS Summary of this function goes here
%   Get a array filled with colors from spectrum
%length_in how many differnt colors included one greytoBlack
%height_in how many light difference for each color

    %gets the length for colors, exclusive blacktowhite
    lengthPalett = length_in-1;
    
    %read in palett image
    palett = im2double(imread('palett.jpg'));
    %resize it to get one pixel for each color
    palett = imresize(palett,[height_in,lengthPalett]);
    %read in greyspecrtrum
    grey = im2double(imread('greySpectrum.jpg'));
    %resize to get (height_in) different grey scale colors
    grey = imresize(grey,[height_in,length_in-lengthPalett]);
    
    %reshape to get it to the right array format
    colorspec(:,1) = reshape(palett(:,:,1),1,[]);
    colorspec(:,2) = reshape(palett(:,:,2),1,[]);
    colorspec(:,3) = reshape(palett(:,:,3),1,[]);
    
     %reshape to get it to the right array format
    greyspec(:,1) = reshape(grey(:,:,1),1,[]);
    greyspec(:,2) = reshape(grey(:,:,2),1,[]);
    greyspec(:,3) = reshape(grey(:,:,3),1,[]);
    
    %gets length of array with the colors
    max = length_in*height_in;
    colors = zeros([max,3]);
    greycount =1;
    %loop to add each color to one array
    for i = 1:1:(max)
        %add the colors to array
       if(i <= length(colorspec(:,1) ))
        
         colors(i,1) = colorspec(i,1);
         colors(i,2) = colorspec(i,2);
         colors(i,3) = colorspec(i,3);
        %add the grey scale colors to array
       else
           colors(i,1) = greyspec(greycount,1);
           colors(i,2) = greyspec(greycount,2);
           colors(i,3) = greyspec(greycount,3);
           greycount = greycount +1;
           
       end
    end
    
    
    


end