function [ best_img_index ] = CheckSSIM( org_img, rep_img_array )
%Compare all the images in the rep_img_array array to org_img and se which
%of these images have to most structural similarities. Returns the index in
%rep_img_array of the best image

    %Change the images types to doubles
    org_imgDouble = im2double(org_img);
    rep_imgDouble = rep_img_array;

    %Threshold value to make sure that it runs at least once
    minSSIM = 100000000;
    
    for i = 1:1:size(rep_img_array, 4)
        
        %Cast to double for each image
        rep_imgDouble(:,:,:,i) = im2double(rep_img_array(:,:,:,i));
        
        %Preform ssim on the original image and the current test image in
        %the array. Original image is resized to match the test images size
        SSIMVAL = ssim(imresize(org_imgDouble, [32, 32]), rep_imgDouble(:,:,:,i));
        
        %If the ssim value is lower than the current lowest, replace it and
        %store the images index
        if (SSIMVAL < minSSIM)
        
            minSSIM = SSIMVAL;
            
            best_img_index = i; 
        
        end
    end

end

