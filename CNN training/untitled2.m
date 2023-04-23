Dataset = imageDatastore('Dataset2', 'IncludeSubfolders', true, 'LabelSource', 'foldernames'); %Processing all images in subfolders in dataset folder
[Training_Dataset, Validation_Dataset] = splitEachLabel(Dataset, 0.7); 
net = resnet18('Weights','none'); %Creation of CNN network structure Resnet is provided as an example. For GoogleNet; net = googlenet('Weights','none')
analyzeNetwork(net);

Input_Layer_Size = net.Layers(1).InputSize; % 1 RGB main input layer layer dimensions are 224x224, 3 for each RGB

%Layer_Graph = layergraph(net); %The model is passed to a variable named 'layer_Graph'
Layer_Graph = net; 

Feature_Learner = net.Layers(69); %As we will change the 142. layer of the model according to ourselves, assigning it to the Feature Learner variable
Output_Classifier = net.Layers(71);%Since we will change the last output layer of the model according to ourselves, we have assigned it to the Output Classifier variable.

Number_of_Classes = numel(categories(Training_Dataset.Labels)); 

New_Feature_Learner = fullyConnectedLayer(Number_of_Classes, ...     %to set layer 142 of the model
    'Name', 'Modelimize uygun katman', ...
    'WeightLearnRateFactor', 10, ...  %learning rates of the model
    'BiasLearnRateFactor', 10);
New_Classifier_Layer = classificationLayer('Name', 'Son katman'); %to set the 144th final layer of the model

Layer_Graph = replaceLayer(Layer_Graph, Feature_Learner.Name, New_Feature_Learner); %To change layer 142 according to our parameters

Layer_Graph = replaceLayer(Layer_Graph, Output_Classifier.Name, New_Classifier_Layer); %To change the 144th layer according to our parameters
analyzeNetwork(Layer_Graph)   
