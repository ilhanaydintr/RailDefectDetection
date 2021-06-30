% This code uses Images folder for feature extraction. 
% First, the features are extracted from Mobilenetv2 and squeezeNet. 
% Afterwards, the feature selection is done by applying relieff algorithm.
% The first 500 samples from each networks are combined and given to SVM.
% You can use MATLAB classification Learner to compare different Machine 
% learning methods on dataset. 
clear all
[trnD,tstD,trnL,tstL]=mobilenet2feature;
[trnD1,tstD1,trnL1,tstL1]=squezefeature;
[idx,weights] = relieff(trnD,trnL,10);
 trnD=trnD(1:1470,idx(1:500));
 [idx1,weights1] = relieff(trnD1,trnL1,10);
 trnD1=trnD1(1:1470,idx1(1:500));
 tstD=tstD(1:368,idx(1:500));
 tstD1=tstD1(1:368,idx1(1:500));
trnF=[trnD trnD1 ];
tstF=[tstD tstD1 ];
classifier = fitcecoc(trnF,trnL);
YPred = predict(classifier,tstF);
accuracy = mean(YPred == tstL);
trn=[trnF;tstF];
L=[trnL;tstL];


