%% ���������ڼ������������еĽ�Ϊ��Ҫ��������OOB��Gini Index��
%% 0.Ԥ����
clear
clc
close all
%% 1.��������
load(['mean_oob.mat']);
load(['mean_gini.mat']);
%% 2.����
%% 2.1
[~,dd1]=sort(mean_oob(:,40),'descend');%���ղ������ȶ�������Ҫ������
disp(['��ʼ��Ҫ������',num2str(dd1')])    %����Խ��ǰ��Խ��Ҫ
%% 2.2
[~,dd2]=sort(mean_gini(:,40),'descend');%���ղ������ȶ�������Ҫ������
disp(['��ʼ��Ҫ������',num2str(dd2')])    %����Խ��ǰ��Խ��Ҫ