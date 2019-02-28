function [ images ] = getImages( howMany )

load('data/test_batch');

images = zeros(32,32,3,howMany);

for imgNr = 1:1:howMany
    
      images(:,:,:,imgNr) = getOneImg(imgNr);

end

end

