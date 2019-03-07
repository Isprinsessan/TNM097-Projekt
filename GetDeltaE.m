function [ idx, DeltaMin, DeltaE] = GetDeltaE( img, L, a, b )

    %Hämtar antalet bilder som orginalbilden ska jämföras med
    nrOfImg = size(L, 2);
    
    %Gör om bilden från rgb till lab
    imgLAB = rgb2lab(img);

    %Tröskelvärde
    DeltaMin = 10000;
    
    %Skapa arrayen av DeltaE, ett värde för varje bild
    DeltaE = zeros(nrOfImg);
    
    %Loopa igenom alla bilderna
    for i = 1:1:nrOfImg
        
        %Beräkna DeltaE för vardera bild i förhållande till orginalbilden
        DeltaE(i) = sqrt((imgLAB(1,1) - L(i))^2 + (imgLAB(1,2) - a(i))^2 + (imgLAB(1,3) - b(i))^2); 
        
        
        %Om det nuvarande DeltaE är mindre än DeltaMin, DeltaE är minst.
        %idx sparar positionen i arrayen
        if(DeltaE(i) < DeltaMin)
            DeltaMin = DeltaE(i);
            idx = i;
        end
        
    end
    
end

