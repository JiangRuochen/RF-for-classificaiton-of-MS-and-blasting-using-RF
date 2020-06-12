%% 本程序用于计算所有特征中的较为重要的特征（OOB误差，Gini Index）
%% 0.预处理
clear
clc
close all
%% 1.导入数据
load(['mean_oob.mat']);
load(['mean_gini.mat']);
%% 2.排序
%% 2.1
[~,dd1]=sort(mean_oob(:,40),'descend');%按照波动幅度对特征重要性排序
disp(['初始重要性排序：',num2str(dd1')])    %排名越靠前的越重要
%% 2.2
[~,dd2]=sort(mean_gini(:,40),'descend');%按照波动幅度对特征重要性排序
disp(['初始重要性排序：',num2str(dd2')])    %排名越靠前的越重要