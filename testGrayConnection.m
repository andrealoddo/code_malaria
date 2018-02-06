% testLowPassFiltering
importDatasets;
backgroundsIm = dir(fullfile(backgroundsDir, '*.tif'));
%outputFolder = fullfile(pwd, 'res', 'avg_malariae');

%I = im2double( imread( fullfile( ALL_IDB1, 'im', 'Im001_1.jpg') ) );
I = im2double( imread( fullfile( plasmodiumVivax, '1703121298', '1703121298-0001.tif') ) );
I = im2double( imread('/Users/andre/Documents/MATLAB/Malaria/2_PlasmodiumDataset/Malariae/1401063467/1401063467-0001-schizonte.tif') );
I = imresize(I, 0.25);

I2 = zeros(size(I));
h = ones(11,11) / 121;

for i=1:3
    I2(:,:,i) = imfilter(I(:,:,i), h);
end

figure; imshow(I);
figure; imshow(I2);
