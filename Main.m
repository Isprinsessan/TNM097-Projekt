%%
%Section: load Images from database
%load('data/test_batch');

nrOfImages = 300;
images = getImages(nrOfImages);

%%
%section to load in one image

%orgImg = imread('landscape.jpeg');
%orgImg = imread('sLOTTET.jpg');
%orgImg = imread('trump.jpg');
orgImg = imread('BROADWAY.jpg');


orgImg = im2double(orgImg);
imshow(orgImg);

%makes the images smaller, each pixel will be one 32x32
smallImg = imgSmaller(orgImg,90);

%imshow(smallImg);

finishimgages = images(:,:,:,i);
%test = data2img(orgImages(:,:,:,1));





%%

%load('1000images.mat');

% 
% imshow(img);
% figure
% 
% imshow(img2)
% figure
 
%Loopa alla bilder som ska anv�ndas och ber�kna medelv�rdet f�r L,a,b f�r
%varje bild
 for i = 1:1:size(images,4)
    [L(i),a(i),b(i)] = GetCIELABMean(images(:,:,:,i));
 end
 
 nrOfSubImages = nrOfImages;
 

 
 
 %Loopa igenom alla pixlar i orginalbilden
 count = 1;
 for h = 1:1:size(smallImg,1)
     for w = 1:1:size(smallImg,2)
         

            %Ber�kna minsta DeltaE och dess index i arrayen
            [idx, DeltaE] = GetDeltaE(smallImg(h,w,:), L, a, b);

            %L�gg bilden med det indexet p� pixelns plats
            finishedImg(:,:,:,count) = images(:,:,:,idx);
            count = count + 1;
         
     end
 end

%%
%show final image
% [height, width ,ch] = size(smallImg);
% imgFinished = montage(finishedImg,'size',[height width]);
% figure
% imshow(smallImg);

%%
%see a small img
% img = data2img(orgImages(:,:,:,800));
% imshow(img);



%%
%Create the final montage image
FinalImg = CreateFinalImg(smallImg, finishedImg);

%imshow(FinalImg);
%%
%MyMontage = get(imgFinished, 'CData');
%imwrite(imgFinished, 'FancyName.tif', 'tif');

[quality, resizedImg] = QualityTest(orgImg, FinalImg, 50);
disp(quality)
figure
imshow(resizedImg);
