%% HUMAN DETECTION with ACF,HOG with CNN network
I = imread('example.jpg'); %upload the image to test here
G = imresize(I, [224, 224]);



detector = peopleDetectorACF;
peopleDetector = vision.PeopleDetector;

  [bboxes] = detectPeopleACF(I);
  [bboxes2] = peopleDetector(I);
  [Label, Prob] = classify(trainedNetwork_1, G);  %use the CNN model trained here. In this example (trainedNetwork_1) trained with GoogleNet..

    isim=char(Label);
    deger=num2str(max(Prob));
if(sum(sum(bboxes))~=0)
    detpic=insertObjectAnnotation(I,"rectangle",bboxes,isim+" "+deger);
    detpic2=insertObjectAnnotation(I,"rectangle",bboxes2,isim+" "+deger);
    
    figure;
    imshow(detpic+detpic2);
   
     title('Human Detected');
 else
 imshow(I);
  title('No Human Detected');
     end
