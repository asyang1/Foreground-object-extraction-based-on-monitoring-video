clear; clc; close all;
%% ����
param.numberOfSamples           = 20;
param.matchingThreshold         = 15;
param.matchingNumber            = 2;
param.updateFactor              = 5;
param.numberOfHistoryImages     = 2;
param.lastHistoryImageSwapped   = 0;

%% ��Ƶ��Ϣ
filename = 'D:\��ѧ��ģ\����\data\question4\hall\input.avi';
vidObj = VideoReader(filename);

firstFrame = true;
height = vidObj.Height;
width = vidObj.Width;

param.height = height;
param.width = width;

%% ViBe�㷨Ŀ����
k=1;
while hasFrame(vidObj)
    vidFrame = readFrame(vidObj);
    vidFrame = rgb2gray(vidFrame);
    vidFrame = double(vidFrame);

    tic;
    if firstFrame
        firstFrame = false;
        initViBe;
    end
    segmentationMap = vibeSegmentation(vidFrame, historyImages, historyBuffer, param);    
    [historyImages, historyBuffer] = vibeUpdate(vidFrame, segmentationMap, historyImages, historyBuffer, param, ...
        jump, neighborX, neighborY, position);
    segmentationMap = medfilt2(segmentationMap);
    toc;
    figure(2), imshow(segmentationMap), title('Segmentation');
    imwrite(segmentationMap,strcat('D:\��ѧ��ģ\����\data\question5\aft-picture\',num2str(k),'.jpg'),'jpg');
    k= k+1;
end