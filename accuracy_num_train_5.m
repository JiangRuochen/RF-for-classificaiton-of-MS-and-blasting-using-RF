%% ���������ڶ�ȡRF_SVD_difft_train.m����ļ�����������ѵ�����в�ͬ�������Խ����Ӱ��
%% 0.׼������
clear
clc
close all
%% 1. ��������
for k=1:40     
load(['D:\����ļ�����\model',num2str(k*5),'.mat']);
Accuracy(:,k)=accuracy';
accuracy_weizhen(:,k)=Accuracy_weizhen';
accuracy_baopo(:,k)=Accuracy_baopo';
end
save Accuracy  Accuracy
save accuracy_weizhen  accuracy_weizhen
save accuracy_baopo  accuracy_baopo