function [ out_img ] = ResizeOrg( org_img, nrOfPixels )
%Resize the original image so that its height and width is evenly divideable by the number of pixels or images   

%Store original image height and width
OrgHeight = size(org_img, 1);
OrgWidth = size(org_img, 2);

%Variable declaration
height = 0;
width = 0;
countH = 0;
countW = 0;


while (height < OrgWidth)
    
    %If the height times the number of pixels required is larger than the
    %original height, this is the height the image will be resized to
    height = countH*nrOfPixels;
    countH = countH + 1;      
    
end


while(width < OrgWidth)
    
    %If the width times the number of pixels required is larger than the
    %original width, this is the width the image will be resized to
    width = countW*nrOfPixels;
    countW = countW + 1;
    
end

%Resize the original image
out_img = resize(org_img, [height, width]);


end

