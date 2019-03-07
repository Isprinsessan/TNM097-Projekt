%%
%Section: load Images from database
%load('data/test_batch');
addpath('scielab');
addpath('data');
nrOfImages = 200;
images = getImages(nrOfImages);
PixelDimensions = 90;
%%
%section to load in one image

%orgImg = imread('landscape.jpeg');
%orgImg = imread('sLOTTET.jpg');
orgImg = imread('trump.jpg');
%orgImg = imread('snyggtjej.jpg');
%orgImg = imread('BROADWAY.jpg');

imshow(orgImg);

orgImg = im2double(orgImg);


%makes the images smaller, each pixel will be one 32x32
smallImg = imgSmaller(orgImg,PixelDimensions);

%imshow(smallImg);

%finishimgages = images(:,:,:,i);
%test = data2img(orgImages(:,:,:,1));





%%

%load('1000images.mat');

% 
% imshow(img);
% figure
% 
% imshow(img2)
% figure
 
%Loopa alla bilder som ska användas och beräkna medelvärdet för L,a,b för
%varje bild
 for i = 1:1:size(images,4)
    [L(i),a(i),b(i)] = GetCIELABMean(images(:,:,:,i));
 end
 
 nrOfSubImages = nrOfImages;
 

 testImg = DivideImg(orgImg, smallImg, nrOfImages);
 %a = size(testImg, 4);
 %Loopa igenom alla pixlar i orginalbilden
 count = 1;
 for h = 1:1:size(smallImg,1)
     for w = 1:1:size(smallImg,2)
            
            %Beräkna minsta DeltaE och dess index i arrayen
            [idx, DeltaE, DeltaEArray] = GetDeltaE(smallImg(h,w,:), L, a, b);

            %Kolla vilken bild som har mest strukturella likheter
            index = FindBestImg(orgImg, smallImg, images, DeltaEArray, DeltaE, PixelDimensions, testImg(:,:,:,count));
            
            %Lägg bilden med det indexet på pixelns plats
            finishedImg(:,:,:,count) = images(:,:,:,index);
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
%Check quality of the image
[quality, resizedImg] = QualityTest(orgImg, FinalImg, 50);
disp(quality)
figure
imshow(resizedImg);

%%
%CHeck structural similarities
