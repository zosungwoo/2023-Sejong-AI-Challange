clear; clc;
rng(0);
%%
trainds = imageDatastore("train/", "IncludeSubfolders",true,LabelSource="foldernames")
% testds = imageDatastore("data/test/img/")
%%
opts = trainingOptions("adam", "MaxEpochs", 3, "MiniBatchSize", 256, "InitialLearnRate", 0.001)
%%
layers = [
    imageInputLayer([28 28 1])

    convolution2dLayer(3,16,'Padding','same')
    batchNormalizationLayer
    reluLayer

    convolution2dLayer(3,32,'Padding','same')
    batchNormalizationLayer
    reluLayer
    maxPooling2dLayer(2, "Stride", 2)
    
    fullyConnectedLayer(128)
    reluLayer
    dropoutLayer(0.8)

    fullyConnectedLayer(10)
    softmaxLayer
    classificationLayer
]
%%
model = trainNetwork(trainds, layers, opts)
%%
trainPred = classify(model,trainds);
trainLabel = trainds.Labels;

accuracy = sum(trainPred == trainLabel)/numel(trainLabel)
confusionchart(trainLabel, trainPred)
%%
csv = readtable('sample_submit.csv');
ypred = classify(model,testds);
csv.label = ypred;
writetable(csv, "submission.csv")