%% ������������֤ÿ�����ѵ������ͬ��������Ŀ�����ս����׼ȷ�Ե�Ӱ��

%% 0.׼������
clear
clc
close all
for j=1:40
%% 1. ��������
load(['D:\input_ML.mat']);
%input_MLΪһ500��105�ľ��� 500��������105������
%% 
i=1;
while i<=100
%% 2. ��ǲ�ͬ���¼���΢��Ϊ1������Ϊ2
label=[ones(250,1);2.*ones(250,1)];
%% 3. �ֱ��о���5,10,15,20,25,30,35,40,45,50,55,60,65,70,75,80,85,90,95,100,105
%% 110,115,120,125,130,135,140,145,150,155,160,165,170,175��180,185,190,195,200��
%% �����������£���50��΢���50�������¼���Ԥ��

%% 3.1 ����ѵ�����Ͳ��Լ� 
temp_weizhen= randperm(200);
temp_baopo=randperm(200);
P_train=[input_ML(temp_weizhen(1:5*j),:);input_ML((250.+temp_baopo(1:5*j)),:)];
T_train=[label(1:(5*j));label(251:(250+5*j))];
P_test=[input_ML(201:250,:);input_ML(451:500,:)];
T_test=[label(201:250);label(451:500)];
%% 3.2 ������ѵ�����ɭ�֣�����ͬһ���ݼ��ظ�100�Σ���ƽ���ͷ��
extra_options.importance=1;
model1 = classRF_train(P_train,T_train,500,floor(sqrt(105)),extra_options);%floor(sqrt(size(X,2))
model{i}=model1;
errtr_all(:,i)=model1.errtr(:,1);
%% 3.3 Ԥ��
T_sim = classRF_predict(P_test,model1);
%% 3.4 ��¼׼ȷ��
accuracy(i)=length(find(T_sim == T_test)) / length(T_test);
Num_correct_weizhen(i)=length(find(T_sim(1:50)==T_test(1:50)));
Accuracy_weizhen(i)=100*Num_correct_weizhen(i)/50;
Num_correct_baopo(i)=length(find(T_sim(51:100)==T_test(51:100)));
Accuracy_baopo(i)=100*Num_correct_baopo(i)/50;
i=i+1;
end
save(['D:\����ļ�����\model',num2str(5*j),'.mat']);
clearvars -except j
end