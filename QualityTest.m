function [quality, resizedImg] = QualityTest(original_img, reproduced_img, viewDist)
%Function to check the quality of the reproduced_img compared to
%original_img on a certain viewDist, using SCIELAB

    %Change the viewingdistance from cm to inches
    viewingDistance = viewDist/2.5;

    %Get the degree per sample
    DegPerSamp = visualAngle(-1,viewingDistance,300,1);
    
    %Create a white point
    whitePoint = [95.05,100,108.9];
    
    %Store the dimensions of the original image
    h = size(original_img, 1);
    w = size(original_img, 2);

    %Resize the created image so it is the same size as the original
    reproduced_img = imresize(reproduced_img, [h, w]);
    resizedImg = reproduced_img;
    
    %Convert images from rgb to xyz
    orgXYZ = rgb2xyz(original_img);
    repXYZ = rgb2xyz(reproduced_img);
    
    %calculate the difference between the two images one pixel at the time
    result = scielab(DegPerSamp, orgXYZ, repXYZ, whitePoint, 'xyz');
    
    %Calculate the mean difference
    quality = mean(mean(result));


end