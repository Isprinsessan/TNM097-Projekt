function [ images ] = splitImg( in_img )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here


[orgHeight,orgWidth,chn] = size(in_img);

%nxn pixeled image
sizeImg = 10;

width = floor(orgWidth/sizeImg);
height = floor(orgHeight/sizeImg);
numberOfImages = width*height;
images = zeros(sizeImg,sizeImg,3,numberOfImages);

n = 1;
   
   

for h = 1:sizeImg:orgHeight

    for w = 1:sizeImg:orgWidth
        for ch = 1:1:3
            images(:,:,ch,n) = in_img(h:(h+sizeImg-1),w:(w+sizeImg-1),ch);


        end
        n = n+1;
    end
end


   
    
    
  

end

