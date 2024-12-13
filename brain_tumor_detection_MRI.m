% Step 1: Unzip the file and create image datastore
zipFilePath = 'BrainTumors.zip'; % Path to your ZIP file
unzip(zipFilePath, 'BrainTumors'); % Unzip into 'BrainTumors' folder

% Create an image datastore
imds = imageDatastore('BrainTumors', 'IncludeSubfolders', true, 'LabelSource', 'foldernames');

% Step 2: Randomly select 10 images from the datastore
numImages = numel(imds.Files); % Get the total number of images
randomIndexes = randperm(numImages, 10); % Get 10 random indexes
selectedImages = imds.Files(randomIndexes); % Select the images

% Step 3: Process each selected image
for i = 1:numel(selectedImages)
    % Read the MRI image
    mriImage = imread(selectedImages{i});

    % Convert to grayscale if the image is in color
    if size(mriImage, 3) == 3
        mriImage = rgb2gray(mriImage);
    end

    % Display the original image
    figure;
    subplot(3, 3, 1);
    imshow(mriImage);
    title('Original MRI Image');

    % Preprocess: Smooth the image to reduce noise
    smoothedImage = imgaussfilt(mriImage, 2); % Gaussian filter
    subplot(3, 3, 2);
    imshow(smoothedImage);
    title('Smoothed Image');

    % Enhance contrast using adaptive histogram equalization
    enhancedImage = adapthisteq(smoothedImage);
    subplot(3, 3, 3);
    imshow(enhancedImage);
    title('Contrast Enhanced Image');

    % Compute the gradient magnitude to highlight edges
    gradientMag = imgradient(enhancedImage);
    subplot(3, 3, 4);
    imshow(gradientMag, []);
    title('Gradient Magnitude');

    % Use adaptive threshold to create a unique threshold for each MRI image
    T = adaptthresh(enhancedImage, 0.4);
    M1 = std(T, [], 'all');
    M2 = mean(T, 'all');
    thresh = M1 + M2;
    negthresh = M2 - M1;

    % Foreground (tumor) markers
    tumorMarkers = imbinarize(enhancedImage, thresh); % Adjust the threshold for your image
    subplot(3, 3, 5);
    imshow(tumorMarkers);
    title('Tumor Markers (Foreground)');

    % Background markers
    backgroundMarkers = imcomplement(imbinarize(enhancedImage, negthresh)); % Use a lower threshold for background
    subplot(3, 3, 6);
    imshow(backgroundMarkers);
    title('Background Markers');

    % Combine the markers
    combinedMarkers = imimposemin(gradientMag, tumorMarkers | backgroundMarkers);

    % Morphological operations to improve region boundaries
    cleanedImage = bwareaopen(tumorMarkers, 50); % Remove small objects
    cleanedImage = imclose(cleanedImage, strel('disk', 5)); % Close gaps in the tumor boundaries
    subplot(3, 3, 7);
    imshow(cleanedImage);
    title('Cleaned Tumor Regions');

    % Overlay the cleaned tumor regions on the original image
    overlayImage = imoverlay(mriImage, cleanedImage, [1, 0, 0]); % Highlight regions in red
    subplot(3, 3, 8);
    imshow(overlayImage);
    title('Overlay of Tumor Regions on Original');

    % Display the combined markers (optional)
    subplot(3, 3, 9);
    imshow(combinedMarkers, []);
    title('Combined Markers');
end
