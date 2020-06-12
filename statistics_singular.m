%% 本程序用于计算时频谱获得的奇异值的统计学特征
%% 0.准备
clear
clc
close all
%% 1.导入数据
load(['时频谱的奇异值的分解结果.mat']);%singular的每一列表示一个信号的奇异值
%计算结果保存在input_ML这个矩阵中（这个矩阵500×105）
input_ML=[];
for i=1:500
%% 2.计算整个信号的统计学参数
  %% 2.1 计算平均值
input_ML(i,1)=mean(singular(i,:));
  %% 2.2 计算中位值
input_ML(i,2)=median(singular(i,:));  
  %% 2.3 计算最大值
input_ML(i,3)=max(singular(i,:));  
  %% 2.4 计算最小值
input_ML(i,4)=min(singular(i,:));    
  %% 2.5 计算标准差
input_ML(i,5)=std(singular(i,:));  
  %% 2.6 计算峰度
input_ML(i,6)=kurtosis(singular(i,:));  
  %% 2.7 计算斜度
input_ML(i,7)=skewness(singular(i,:)); 
%% 3.分区间计算各个区间的统计学参数（第一个区间为51个样本,以后的每一个区间为150个样本，总共14个区间）
%% 3.1 计算第一个区间
input_ML(i,8)=mean(singular(i,1:51));%平均值
input_ML(i,9)=median(singular(i,1:51));%中位值 
input_ML(i,10)=max(singular(i,1:51)); %最大值 
input_ML(i,11)=min(singular(i,1:51));%最小值    
input_ML(i,12)=std(singular(i,1:51)); %标准差 
input_ML(i,13)=kurtosis(singular(i,1:51)); %峰度 
input_ML(i,14)=skewness(singular(i,1:51));%斜度
%% 3.2 计算剩下的13个区间
  for j=1:13
input_ML(i,14+1+7*(j-1))=mean(singular(i,(51+1+150*(j-1)):(51+150+150*(j-1))));%平均值
input_ML(i,14+2+7*(j-1))=median(singular(i,(51+2+150*(j-1)):(51+150+150*(j-1))));  %中位值 
input_ML(i,14+3+7*(j-1))=max(singular(i,(51+3+150*(j-1)):(51+150+150*(j-1))));% 最大值  
input_ML(i,14+4+7*(j-1))=min(singular(i,(51+4+150*(j-1)):(51+150+150*(j-1))));%  最小值    
input_ML(i,14+5+7*(j-1))=std(singular(i,(51+5+150*(j-1)):(51+150+150*(j-1))));%  标准差 
input_ML(i,14+6+7*(j-1))=kurtosis(singular(i,(51+6+150*(j-1)):(51+150+150*(j-1))));%峰度   
input_ML(i,14+7+7*(j-1))=skewness(singular(i,(51+7+150*(j-1)):(51+150+150*(j-1))));% 斜度     
  end
end

%% 4.保存计算结果
save input_ML input_ML






  
  
  
  