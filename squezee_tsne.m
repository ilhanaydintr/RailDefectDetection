net=squeezenet;
earlyLayerName = "pool5";
finalConvLayerName = "conv";
softmaxLayerName = "prob";
pool1Activations = activations(net,...
    augImdsTrain,earlyLayerName,"OutputAs","rows");
finalConvActivations = activations(net,...
    augImdsTrain,finalConvLayerName,"OutputAs","rows");
softmaxActivations = activations(net,...
    augImdsTrain,softmaxLayerName,"OutputAs","rows");
rng default
pool1tsne = tsne(pool1Activations);
finalConvtsne = tsne(finalConvActivations);
softmaxtsne = tsne(softmaxActivations);
doLegend = 'on';
markerSize = 7;
classList = unique(valImds.Labels);
numClasses = length(classList);
colors = lines(numClasses);
figure;
gscatter(pool1tsne(:,1),pool1tsne(:,2),trainImds.Labels, ...
    [],'.',markerSize,doLegend);
title("fire9-concat");

figure,
gscatter(finalConvtsne(:,1),finalConvtsne(:,2),trainImds.Labels, ...
    [],'.',markerSize,doLegend);
title("conv-10");

figure,
gscatter(softmaxtsne(:,1),softmaxtsne(:,2),trainImds.Labels, ...
    [],'.',markerSize,doLegend);
title("softmax");
