%test illumination correction
importDatasets;
backgroundsIm = dir(fullfile(backgroundsDir, '*.tif'));

I = im2double( imread( fullfile( plasmodiumVivax, '1703121298', '1703121298-0001.tif') ) );
I = im2double( imread('/Users/andre/Documents/MATLAB/Malaria/2_PlasmodiumDataset/Malariae/1401063467/1401063467-0001-schizonte.tif') );
I = imresize(I, 0.25);

i = 2;
B = im2double( imread( fullfile( backgroundsIm(i).folder, backgroundsIm(i).name ) ) );
B = imresize(B, 0.25);

B_avgR = mean( mean(B(:,:,1)) );
B_avgG = mean( mean(B(:,:,2)) );
B_avgB = mean( mean(B(:,:,3)) );

B2_R = ones(size(B,1), size(B,2)) * B_avgR;
B2_G = ones(size(B,1), size(B,2)) * B_avgG;
B2_B = ones(size(B,1), size(B,2)) * B_avgB;

B_avg = cat(3, B2_R, B2_G, B2_B);
B3 = double(  B_avg - B );
figure; imshow(B3);

diff = I + B3;

figure; imshow(diff);

bw = rgb2gray(diff) > 0.31;
figure; imshow(bw);

newI = ((1-diff) );

figure; imshow(newI);
