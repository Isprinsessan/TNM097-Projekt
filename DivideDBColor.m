function [images] = DivideDBColor(colors,DB, L,a,b)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

images = zeros(32,32,3,size(colors,1));
for i = 1:1:size(colors,1)
         

            %Ber�kna minsta DeltaE och dess index i arrayen
            [idx, DeltaE] = GetDeltaE(colors(i,:), L, a, b);

           
            images(:,:,:,i) = DB(:,:,:,idx);
            
         
 end

end

