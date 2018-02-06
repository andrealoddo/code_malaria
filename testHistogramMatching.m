% testHistogramMatching
importDatasets;
backgroundsIm = dir(fullfile(backgroundsDir, '*.tif'));
%outputFolder = fullfile(pwd, 'res', 'avg_malariae');

%I = im2double( imread( fullfile( plasmodiumVivax, '1703121298', '1703121298-0001.tif') ) );
I = imread('/Users/andre/Documents/MATLAB/Malaria/2_PlasmodiumDataset/Malariae/1401063467/1401063467-0001-schizonte.tif');
I2 = imread('/Users/andre/Documents/MATLAB/Malaria/2_PlasmodiumDataset/Falciparum/1603223711/1603223711-0001.tif');
I3 = imread('/Users/andre/Google Drive/PhD/Work/Datasets/ALL_IDB/ALL_IDB1/im/Im001_1.jpg');

B = imhistmatch(I, rgb2gray(I2));

figure
imshow(imresize(I, 0.25))
title('RGB Malariae Image')

figure
imshow(imresize(I2, 0.25))
title('RGB Falciparum Image')

figure
imshow(imresize(B, 0.25))
title('Histogram Matched RGB Image')
