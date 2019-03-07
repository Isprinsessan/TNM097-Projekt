function [ out_img ] = DivideImg( org_img, smallImg, nrOfImg )
    
    height = size(org_img, 1);
    width = size(org_img, 2);
    smallHeight = size(smallImg, 1);
    smallWidth = size(smallImg, 2);
    
    NumberOfImgHeight = floor(height/smallHeight);
    NumberOfImgWidth = floor(width/smallWidth);
    
    n = 1;
    
        for h = 1:NumberOfImgHeight:height
            for w = 1:NumberOfImgWidth:width
                for ch = 1:1:3
                  out_img(:,:,ch,n) =  org_img(h:(h+NumberOfImgHeight-1),w:(w+NumberOfImgWidth-1),ch);
                end
                  n = n + 1;
                  
            end
        end
    
end

