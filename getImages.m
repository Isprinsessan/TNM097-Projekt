function [ images ] = getImages( howMany )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here


load('data/test_batch');
%image = zeros(32,32,3);
count = 1;
nr = howMany
images = zeros(32,32,3,howMany);
for imgNr = 1:1:howMany
    
      images(:,:,:,imgNr) = getOneImg(imgNr);

    
end

end

