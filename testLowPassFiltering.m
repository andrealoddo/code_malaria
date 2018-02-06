% testGrayConnection
importDatasets;
backgroundsIm = dir(fullfile(backgroundsDir, '*.tif'));
%outputFolder = fullfile(pwd, 'res', 'avg_malariae');

%I = im2double( imread( fullfile( ALL_IDB1, 'im', 'Im001_1.jpg') ) );
%I = im2double( imread( fullfile( plasmodiumVivax, '1703121298', '1703121298-0001.tif') ) );
I = imread('/Users/andre/Documents/MATLAB/Malaria/2_PlasmodiumDataset/Malariae/1401063467/1401063467-0001-schizonte.tif');
I = imresize(I, 0.25);
G = rgb2gray(I);
BW = zeros(size(I));

seedrow = 320; seedcol = 255; tol = 20;

for i=1:3
    BW(:,:,i) = grayconnected(I(:,:,1), seedrow, seedcol, tol);
end

subplot(2,3,1); imshow(I);
subplot(2,3,2); imshow(G);
subplot(2,3,3); imshow(~BW(:,:,1));
subplot(2,3,4); imshow(BW(:,:,2));
subplot(2,3,5); imshow(BW(:,:,3));
