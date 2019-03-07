function [ out_img ] = DivideImg( org_img, smallImg)
%Divide org_img into multiple different images based on the size of
%smallImg. Used to calculate the structural similarities between areas in
%the image and the test images

    %Store height and width of the input images
    height = size(org_img, 1);
    width = size(org_img, 2);
    smallHeight = size(smallImg, 1);
    smallWidth = size(smallImg, 2);
    
    %Calculate how many segments the original image will be divided in
    NumberOfImgHeight = floor(height/smallHeight);
    NumberOfImgWidth = floor(width/smallWidth);
    
    n = 1;
    
    NumberOfImages = (height/NumberOfImgHeight) * (width/NumberOfImgWidth);
    
    out_img = zeros(NumberOfImgHeight, NumberOfImgWidth, 3, NumberOfImages);
    size(org_img)
    %Loop through all the segments
    for h = 1:NumberOfImgHeight:height
        for w = 1:NumberOfImgWidth:width
            
            %Loop through the 3 color channels
            for ch = 1:1:3
                
              %Create an array containing the segments based on the
              %original image
              out_img(:,:,ch,n) =  org_img(h:(h+NumberOfImgHeight-1),w:(w+NumberOfImgWidth-1),ch);

            end
            
            %For each complete loop of the color channels, one image is
            %created
            n = n + 1;

        end
    end
    
end

