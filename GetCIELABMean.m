function [ L,a,b ] = GetCIELABMean( image )
    

    %G�r om orginalbilden till lab
    imgLAB = rgb2lab(image);
    
    %R�kna ut medelv�rdet f�r L,a,b f�r varje bild
    L = mean(mean(imgLAB(:,:,1)));
    a = mean(mean(imgLAB(:,:,2)));
    b = mean(mean(imgLAB(:,:,3)));


end

