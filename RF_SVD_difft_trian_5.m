%% 本程序用于验证每个类别训练集不同样本的数目对最终结果的准确性的影响

%% 0.准备工作
clear
clc
close all
for j=1:40
%% 1. 载入数据
load(['D:\input_ML.mat']);
%input_ML为一500×105的矩阵 500个样本，105个属性
%% 
i=1;
while i<=100
%% 2. 标记不同的事件，微震为1，爆破为2
label=[ones(250,1);2.*ones(250,1)];
%% 3. 分别研究在5,10,15,20,25,30,35,40,45,50,55,60,65,70,75,80,85,90,95,100,105
%% 110,115,120,125,130,135,140,145,150,155,160,165,170,175，180,185,190,195,200个
%% 样本的条件下，对50个微震和50个爆破事件的预测

%% 3.1 生成训练集和测试集 
temp_weizhen= randperm(200);
temp_baopo=randperm(200);
P_train=[input_ML(temp_weizhen(1:5*j),:);input_ML((250.+temp_baopo(1:5*j)),:)];
T_train=[label(1:(5*j));label(251:(250+5*j))];
P_test=[input_ML(201:250,:);input_ML(451:500,:)];
T_test=[label(201:250);label(451:500)];
%% 3.2 创建、训练随机森林（对于同一数据及重复100次，求平均和方差）
extra_options.importance=1;
model1 = classRF_train(P_train,T_train,500,floor(sqrt(105)),extra_options);%floor(sqrt(size(X,2))
model{i}=model1;
errtr_all(:,i)=model1.errtr(:,1);
%% 3.3 预测
T_sim = classRF_predict(P_test,model1);
%% 3.4 记录准确性
accuracy(i)=length(find(T_sim == T_test)) / length(T_test);
Num_correct_weizhen(i)=length(find(T_sim(1:50)==T_test(1:50)));
Accuracy_weizhen(i)=100*Num_correct_weizhen(i)/50;
Num_correct_baopo(i)=length(find(T_sim(51:100)==T_test(51:100)));
Accuracy_baopo(i)=100*Num_correct_baopo(i)/50;
i=i+1;
end
save(['D:\分类的计算结果\model',num2str(5*j),'.mat']);
clearvars -except j
end