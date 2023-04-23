



I = imread('example.jpg'); %Upload a sample image here. For example "example.jpg"
peopleDetector = vision.PeopleDetector;
bboxes = peopleDetector(I);
%I = insertObjectAnnotation(I,"rectangle",bboxes);
figure, imshow(I);
%title('Detected people and detection scores');


[Label, Prob] = classify(trainedNetwork_1, G);
    isim=char(Label);
    deger=num2str(max(Prob));

    
    detpic=insertObjectAnnotation(I,"rectangle",bboxes,isim+" "+deger);
    imshow(detpic);