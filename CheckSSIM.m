function [ best_img_index ] = CheckSSIM( org_img, rep_img_array )

    org_imgDouble = im2double(org_img);
    
    rep_imgDouble = rep_img_array;

    minSSIM = 100000000;
    
    for i = 1:1:size(rep_img_array, 4)
        
        rep_imgDouble(:,:,:,i) = im2double(rep_img_array(:,:,:,i));
        
        %disp(size(rep_img_array) + " size(rep_img_array");
        
        SSIMVAL = ssim(imresize(org_imgDouble, [32, 32]), rep_imgDouble(:,:,:,i));
        
        if (SSIMVAL < minSSIM)
        
            minSSIM = SSIMVAL;
            
            best_img_index = i; 
        
        end
    end

end

