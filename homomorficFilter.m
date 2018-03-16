function [outI] = homomorficFilter(I)

    %I = rgb2hsv(I);
    %I = I(:,:,2);
    outI = zeros(size(I), 'uint8');
    orI = I;
    
    for i=1:3
        I = orI(:,:,i);
        
        % The first step is to convert the input image to the log domain. 
        % Before that we will also convert the image to floating-point type.
        I = im2double(I);
        I = log(1 + I);

        % Frequency-domain high-pass filter construction.
        M = 2*size(I,1) + 1;
        N = 2*size(I,2) + 1;

        % Note that we can make the size of the filter (M,N) even numbers 
        % to speed-up the FFT computation, but we will skip that step 
        % for the sake of simplicity. Next, we choose a standard deviation for the 
        % Gaussian which determines the bandwidth of low-frequency band that will be filtered out.
        sigma = 10;

        % And create the high-pass filter...
        [X, Y] = meshgrid(1:N,1:M);
        centerX = ceil(N/2);
        centerY = ceil(M/2);
        gaussianNumerator = (X - centerX).^2 + (Y - centerY).^2;
        H = exp(-gaussianNumerator./(2*sigma.^2));
        H = 1 - H;

        % Couple of things to note here. First, we formulate a low-pass filter and 
        % then subtracted it from 1 to get the high-pass filter. 
        % Second, this is a centered filter in that the zero-frequency is at the center.
        %imshow(H,'InitialMagnification',25)

        H = fftshift(H);

        If = fft2(I, M, N);
        Iout = real(ifft2(H.*If)); 
        Iout = Iout(1:size(I,1),1:size(I,2));

        filteredI = exp(Iout) - 1;

        %outI = cat(i, filteredI);
        outI(:,:,i) = filteredI;
        
    end
    
end