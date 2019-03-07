function [ idx, DeltaMin, DeltaE] = GetDeltaE( img, L, a, b )

    %H�mtar antalet bilder som orginalbilden ska j�mf�ras med
    nrOfImg = size(L, 2);
    
    imgLAB = rgb2lab(img);

    DeltaMin = 10000;
    
    DeltaE = zeros(nrOfImg);
    
    %Loopa igenom alla bilderna
    for i = 1:1:nrOfImg
        
        %Ber�kna DeltaE f�r vardera bild i f�rh�llande till orginalbilden
        DeltaE(i) = sqrt((imgLAB(1,1) - L(i))^2 + (imgLAB(1,2) - a(i))^2 + (imgLAB(1,3) - b(i))^2); 
        
        
        %Om det nuvarande DeltaE �r mindre �n DeltaMin, DeltaE �r minst.
        %idx sparar positionen i arrayen
        if(DeltaE(i) < DeltaMin)
            DeltaMin = DeltaE(i);
            idx = i;
        end
        
    end
    
end

