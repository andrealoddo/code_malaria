PathNameRoot = 'C:\Users\Andre\Google Drive\PhD\Work\Datasets\PLASMODIUM_IDB\2_PlasmodiumDataset\Malariae\1401063467';

[FileName,PathName,FilterIndex] = uigetfile([PathNameRoot, '*.tif']);
[FileName2,PathName2,FilterIndex2] = uigetfile([PathNameRoot, '*.jpg']);

width = 800;

I = imread ([PathName, FileName]);
II = imread([PathName, FileName]);

I2 = I;
figure; imshow(I);

Ref = imcrop(II, [size(II,1)/2, 0, width-1, size(II,2)]);

% Left part
I_left = I(1:end, 1:width, :);
I3 = imhistmatch(I_left, Ref);

% Right part
I_right = I(1:end, end-width+1:end, :);
I4 = imhistmatch(I_right, Ref);

% Central part
I_centre = I(1:end, width:end-width, :);
I5 = imhistmatch(I_centre, Ref);

I(1:end, 1:width, :) = I3;
I(1:end, end-width+1:end, :) = I4;
%I(1:end, width:end-width, :) = I5;

J = imhistmatch(I2, Ref, 5);

%figure; imshow(Ref);
figure; imshow(I);
figure; imshow(J);



