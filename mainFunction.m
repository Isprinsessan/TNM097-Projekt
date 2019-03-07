function [img_out] = mainFunction(orgImg,option)
%UNTITLED3 Summary of this function goes here
%orgImg imread('img');, option is what type of DB



%%
%Section: load Images from database
%load('data/test_batch');

%nrOfImages = 1000;
%images = getImages(nrOfImages);
%%
%load 1000 images

load('images.mat');

%%
%section to load in one image
orgImg = im2double(orgImg);
imshow(orgImg);

PixelDimensions = 80;

%makes the images smaller, each pixel will be one 32x32
smallImg = imgSmaller(orgImg,PixelDimensions);

%Resize the original image based on the amount of images per dimension. For
%the SSIM
orgImg = ResizeOrg(orgImg, PixelDimensions);

abcd = size(orgImg);
%imshow(smallImg);

%% 

%Loopa alla bilder som ska anv�ndas och ber�kna medelv�rdet f�r L,a,b f�r
%varje bild
 for i = 1:1:size(images,4)
    [L(i),a(i),b(i)] = GetCIELABMean(images(:,:,:,i));
 end
 
%%
%use all images in database
%Loopa igenom alla pixlar i orginalbilden
if(option == 1)
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
%Make the database smaller depending on orgimage colorbase
elseif(option == 2)
[X,cMap] = rgb2ind(orgImg, 100); 
imagesResized = DivideDBColor(cMap,images,L,a,b);


 for i = 1:1:size(imagesResized,4)
    [LS(i),aS(i),bS(i)] = GetCIELABMean(imagesResized(:,:,:,i));
 end
 
 %Loopa igenom alla pixlar i orginalbilden
 count = 1;
 for h = 1:1:size(smallImg,1)
     for w = 1:1:size(smallImg,2)
         

            %Ber�kna minsta DeltaE och dess index i arrayen
            [idx, DeltaE] = GetDeltaE(smallImg(h,w,:), LS, aS, bS);

            %L�gg bilden med det indexet p� pixelns plats
            finishedImg(:,:,:,count) = imagesResized(:,:,:,idx);
            count = count + 1;
         
     end
 end

%%
%Make the database smaller depending on colorarray
%add palette color array
elseif(option==3)
colors = getColors(20,10);
imagesResized = DivideDBColor(colors,images,L,a,b);


 for i = 1:1:size(imagesResized,4)
    [LS(i),aS(i),bS(i)] = GetCIELABMean(imagesResized(:,:,:,i));
 end
 
 %Loopa igenom alla pixlar i orginalbilden
 count = 1;
 for h = 1:1:size(smallImg,1)
     for w = 1:1:size(smallImg,2)
         

            %Ber�kna minsta DeltaE och dess index i arrayen
            [idx, DeltaE, DeltaEArray] = GetDeltaE(smallImg(h,w,:), LS, aS, bS);

            %L�gg bilden med det indexet p� pixelns plats
            finishedImg(:,:,:,count) = imagesResized(:,:,:,idx);
            count = count + 1;
         
     end
 end
elseif(option == 4)
 
     %Get the array of the best color images
     colors = getColors(20,10);
     imagesResized = DivideDBColor(colors,images,L,a,b);
     
     %Get LAB-means for each image in the color array
     for i = 1:1:size(imagesResized,4)
        [LR(i),aR(i),bR(i)] = GetCIELABMean(imagesResized(:,:,:,i));
     end
     
     %Divide the original image into smaller images so that the structural
     %similarities can be calculated
     testImg = DivideImg(orgImg, smallImg, size(colors, 1));
     
     %Dispaly that the function has started
     procent = 0;
     disp(procent + "%");
     
     count = 1;
     
     %Loopa igenom alla pixlar i orginalbilden
     for h = 1:1:size(smallImg,1)
         for w = 1:1:size(smallImg,2)

                %Ber�kna minsta DeltaE och dess index i arrayen
                [idx, DeltaE, DeltaEArray] = GetDeltaE(smallImg(h,w,:), LR, aR, bR);

                %Kolla vilken bild som har mest strukturella likheter
                index = FindBestImg(imagesResized, DeltaEArray, DeltaE, testImg(:,:,:,count));

                %L�gg bilden med det indexet p� pixelns plats
                finishedImg(:,:,:,count) = imagesResized(:,:,:,index);
                count = count + 1;

         end
         
            %Variabel f�r att se hur l�ngt funktionen har kommit
            procent = (h/size(smallImg, 1))*100;
            disp(procent + "%");
            
         
     end

end


%%
%Create the final montage image
FinalImg = CreateFinalImg(smallImg, finishedImg);

imshow(FinalImg);
%%
%MyMontage = get(imgFinished, 'CData');
%imwrite(imgFinished, 'FancyName.tif', 'tif');

[quality, resizedImg] = QualityTest(orgImg, FinalImg, 50);
disp(quality)
figure
imshow(resizedImg);

img_out = FinalImg;

end

