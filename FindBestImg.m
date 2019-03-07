function [ return_index ] = FindBestImg( org_img, smallImg, images, DeltaE, DeltaMin, nrOfImages, testImg)

    %Find index for lowest Delta value
    for i = 1:1:size(DeltaE, 2)
        if(DeltaE(i) - DeltaMin < 0.001)
            idx = i;
        end
    end

    %Store the image with the lowest delta value as the first image in the
    %array
    ssimArray(:,:,:,1) = images(:,:,:,idx);
    indexArray(1) = idx;
    count = 2;
    threshold = 10.0;
   
    
    for j = 1:1:20
         
        if( abs(DeltaE(j) - DeltaMin) < threshold)
        
            ssimArray(:,:,:,count) = images(:,:,:,j); 
            indexArray(count) = j;
            
            count = count + 1;
             
        end
    
    end
    
    best_img_idx = CheckSSIM(testImg, ssimArray); 
    
    return_index = indexArray(best_img_idx);


end

