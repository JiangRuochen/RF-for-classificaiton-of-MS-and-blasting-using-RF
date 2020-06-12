%% 本程序用于读取RF_SVD_difft_train.m程序的计算结果，分析训练集中不同样本数对结果的影响
%% 0.准备工作
clear
clc
close all
%% 1. 载入数据
for k=1:40     
load(['D:\分类的计算结果\model',num2str(k*5),'.mat']);
Accuracy(:,k)=accuracy';
accuracy_weizhen(:,k)=Accuracy_weizhen';
accuracy_baopo(:,k)=Accuracy_baopo';
end
save Accuracy  Accuracy
save accuracy_weizhen  accuracy_weizhen
save accuracy_baopo  accuracy_baopo