
I1 = imread('example.jpg''); %Upload a sample image here. For example "example.jpg"

%[featureVector,hogVisualization] = extractHOGFeatures(I1);
[hog,visualization] = extractHOGFeatures(I1,'CellSize',[8 8],'BlockSize',[2 2],'BlockOverlap',[1 1],'NumBins',8);
 
imshow(I1);
hold on
plot(visualization);