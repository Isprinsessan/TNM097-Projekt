function [ return_index ] = FindBestImg(images, DeltaE, DeltaMin, testImg)
%Finds the image in the array images that has the most structural
%similarities as testImg while still having an acceptable color similarity


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
    
    %Threshold for how close to the lowest DeltaE an image have to be to be saved
    threshold = 1.0;
   
    %Loop through the amount of images you want to compare structures to
    for j = 1:1:20%size(DeltaE, 2)
         
        %If the difference is lower than the threshold, store it in an
        %array of images. Also store the images index.
        if( abs(DeltaE(j) - DeltaMin) < threshold)
        
            ssimArray(:,:,:,count) = images(:,:,:,j); 
            indexArray(count) = j;
            
            count = count + 1;
             
        end
    
    end
    
    %Preform SSIM on the array of images that has been saved
    best_img_idx = CheckSSIM(testImg, ssimArray); 
    
    %Return the index of the best image
    return_index = indexArray(best_img_idx);


end

