importDatasets;
outputFolder = fullfile(pwd, 'res', 'avg');

%I = im2double( imread( fullfile( ALL_IDB1, 'im', 'Im001_1.jpg') ) );
I = im2double( imread( fullfile( plasmodiumVivax, '1703121298', '1703121298-0001.tif') ) );
I = imresize(I, 0.25);

backgroundsIm = dir(fullfile(backgroundsDir, '*.tif'));

for j=1:size(backgroundsIm)
    %I = imread( fullfile(imagesDir, images(countI).name) );
    B = im2double( imread( fullfile( backgroundsIm(j).folder, backgroundsIm(j).name ) ) );
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
    diffName = backgroundsIm(j).name;
    figure; imshow(diff);
    imwrite(diff, fullfile(outputFolder, diffName));
        
end