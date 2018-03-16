% testHistogramMatching

I = imread('/Users/andre/Documents/MATLAB/Malaria/2_PlasmodiumDataset/Malariae/1401063467/1401063467-0001-schizonte.tif');
I2 = imread('/Users/andre/Documents/MATLAB/Malaria/2_PlasmodiumDataset/Falciparum/1603223711/1603223711-0001.tif');
I3 = imread('/Users/andre/Google Drive/PhD/Work/Datasets/ALL_IDB/ALL_IDB1/im/Im001_1.jpg');

I = homomorficFilter(I);
imshow(I);

I2 = homomorficFilter(I2);

%B = imhistmatch(I, rgb2gray(I2));
B = imhistmatch(I, I2);

figure;
subplot(2,2,1), imshow(imresize(I, 0.25)), title('RGB Malariae schizont');

subplot(2,2,2), imshow(imresize(I2, 0.25)), title('RGB Falciparum parasite');

subplot(2,2,3), imshow(imresize(B, 0.25)), title('Histogram Matched RGB Image');