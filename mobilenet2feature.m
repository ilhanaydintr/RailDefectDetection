function [trnD,tstD,trnL,tstL]=mobilenet2feature
% This code is used to extract features from  mobileNetv2. The input images
% should be given in a directory named as Images. The features are
% extracted from global_average_pooling2d_1. The outputs of this function
% are  trnD, tstD,trnL, and tstL. The parameters trnD and trnL represent
% the training data and training labels. The other two parameters(tstD and
% tstL) are used for test data. 
net = mobilenetv2();
imds = imageDatastore('Images\', ...
    "IncludeSubfolders", true, "LabelSource", "foldernames");
aug = imageDataAugmenter("RandXReflection", true, ...
    "RandYReflection", true, ...
    "RandXScale", [0.8 1.2], ...
    "RandYScale", [0.8 1.2]);
trainingFraction = 0.80;
[trainImds,valImds] = splitEachLabel(imds, trainingFraction);
augImdsTrain = augmentedImageDatastore([224 224], trainImds, ...
    'DataAugmentation', aug);
augImdsVal = augmentedImageDatastore([224 224], valImds);
%inputSize = net.Layers(1).InputSize;
% augimdsTrain = augmentedImageDatastore(inputSize(1:2),trainImds);
% augimdsTest = augmentedImageDatastore(inputSize(1:2),valImds);
layer = 'global_average_pooling2d_1';
%layer='node_200';
tic
featuresTrain = activations(net,augImdsTrain,layer,'OutputAs','rows');
toc
featuresTest = activations(net,augImdsVal,layer,'OutputAs','rows');
YTrain = trainImds.Labels;
YTest = valImds.Labels;
trnD=featuresTrain;
trnL=YTrain;
tstD=featuresTest;
tstL=YTest;
