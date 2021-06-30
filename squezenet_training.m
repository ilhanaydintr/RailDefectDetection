lgraph = layerGraph(squeezenet());
lgraph = lgraph.replaceLayer("ClassificationLayer_predictions",...
    classificationLayer("Name", "ClassificationLayer_predictions"));

newConv =  convolution2dLayer([14 14], 4, "Name", "conv", "Padding", "same");
lgraph = lgraph.replaceLayer("conv10", newConv);
imds = imageDatastore('Images\', ...
    "IncludeSubfolders", true, "LabelSource", "foldernames");

aug = imageDataAugmenter("RandXReflection", true, ...
    "RandYReflection", true, ...
    "RandXScale", [1 1.2], ...
    "RandYScale", [1 1.2]);

trainingFraction = 0.70;
[trainImds,valImds] = splitEachLabel(imds, trainingFraction);

augImdsTrain = augmentedImageDatastore([227 227], trainImds, ...
    'DataAugmentation', aug);
augImdsVal = augmentedImageDatastore([227 227], valImds);
opts = trainingOptions("adam", ...
    "InitialLearnRate", 1e-4, ...
    "MaxEpochs", 10, ...
    "ValidationData", augImdsVal, ...
    "Verbose", false,...
    "Plots", "training-progress", ...
    "ExecutionEnvironment","gpu",...
    'ValidationFrequency',20, ...
    "MiniBatchSize",64);
% opts = trainingOptions('sgdm', ...
%     'MaxEpochs',50, ...
%     'MiniBatchSize',64, ...
%     'Shuffle','every-epoch', ...
%     'Plots','training-progress', ...
%     'InitialLearnRate',1e-5, ...
%     'Shuffle','every-epoch', ...
%     'ValidationFrequency',3, ...
%     'Verbose',false, ...
%     'ValidationData',testSet);
rng default
net = trainNetwork(augImdsTrain, lgraph, opts);