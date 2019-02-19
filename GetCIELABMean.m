function [ L,a,b ] = GetCIELABMean( image )
    

    %Gör om orginalbilden till lab
    imgLAB = rgb2lab(image);
    
    %Räkna ut medelvärdet för L,a,b för varje bild
    L = mean(mean(imgLAB(:,:,1)));
    a = mean(mean(imgLAB(:,:,2)));
    b = mean(mean(imgLAB(:,:,3)));


end

