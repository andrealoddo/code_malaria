% testCorrection 
close all;

vivax = imread( '/Users/andre/Documents/MATLAB/Malaria/2_PlasmodiumDataset/Vivax/1703121298/1703121298-0001.tif' );
malariae =  imread('/Users/andre/Documents/MATLAB/Malaria/2_PlasmodiumDataset/Malariae/1401063467/1401063467-0001-schizonte.tif' );
vivax = imresize(vivax, 0.25);
malariae = imresize(malariae, 0.25);

vivax2 = uint8(zeros(size(vivax)));
vivax3 = vivax2;
malariae2 = uint8(zeros(size(malariae)));
malariae3 = malariae2;

for i=1:size(vivax, 3)
    vivax2(:,:,i) = imtophat(vivax(:,:,i), strel('disk',15));
    malariae2(:,:,i) = imtophat(malariae(:,:,i), strel('disk',15));
end

for i=1:size(vivax2, 3)
    vivax3(:,:,i) = imadjust(vivax2(:,:,i));
    malariae3(:,:,i) = imadjust(malariae2(:,:,i));
end

figure(1); imshow(vivax3);
figure(2); imshow(malariae3);

vivax_bw = imbinarize(vivax3);
vivax_bw = bwareaopen(vivax_bw, 50);
malariae_bw = imbinarize(malariae3);
malariae_bw = bwareaopen(malariae_bw, 50);

vivax_bw = vivax_bw(:,:,1) & vivax_bw(:,:,2) & vivax_bw(:,:,3);
malariae_bw = malariae_bw(:,:,1) & malariae_bw(:,:,2) & malariae_bw(:,:,3);

figure(3); imshow(vivax_bw);
figure(4); imshow(malariae_bw);

meanV = min(vivax_bw(:) == 1) * ones(size(vivax));
meanM = min(malariae_bw(:) == 1) * ones(size(malariae));

diffV = im2double(vivax) + meanV;
diffM = im2double(malariae) + meanM;

figure(5); imshow(diffV);
figure(6); imshow(diffM);

