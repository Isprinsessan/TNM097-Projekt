function [images] = DivideDBColor(colors,DB, L,a,b)
%UNTITLED Summary of this function goes here
%  Splits the image data base to have one image for each color

%set size of array with images
images = zeros(32,32,3,size(colors,1));
%loops through all colors to add one image for each color
for i = 1:1:size(colors,1)
         

            %Ber�kna minsta DeltaE och dess index i arrayen
            [idx, DeltaE] = GetDeltaE(colors(i,:), L, a, b);
            
            %adds the image with the best deltaE color to array
            images(:,:,:,i) = DB(:,:,:,idx);
            
         
 end

end

