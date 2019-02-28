function [ images ] = CreateFinalImg( orgImg, finishedImg )

    orgHeight = size(orgImg,1);
    orgWidth = size(orgImg,2);
    chn = size(finishedImg, 3);
    %nxn pixeled image
    sizeImg = 32;

    width = floor(orgWidth/sizeImg);
    height = floor(orgHeight/sizeImg);

    images = zeros(sizeImg*orgHeight,sizeImg*orgWidth,3);

    n = 1;
    for h = 1:sizeImg:(orgHeight*sizeImg)
        for w = 1:sizeImg:(orgWidth*sizeImg)
            for ch = 1:1:3

                images(h:(h+sizeImg-1),w:(w+sizeImg-1),ch) = finishedImg(:,:,ch,n);

            end
            n = n+1;
        end
    end

end

