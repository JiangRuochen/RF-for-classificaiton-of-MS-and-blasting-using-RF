%% ���������ڼ����ڲ�ͬ��������Ŀ�£� ���������ͬ������������Ҫ�ԣ���ֵ����׼�
%% 0.׼��
clear
clc
close all
%% 
for m=1:40
%% ��������
load(['D:\����ļ�����\model',num2str(5*m),'.mat']);
  for j=1:100
      OOB_error{m}(:,j)=model1.importance(:,1);%��¼�����н����OOB 
      Gini_error{m}(:,j)=model1.importance(:,end);
  end
  mean_oob(:,m)=mean(OOB_error{m},2);
  std_oob(:,m)=std(OOB_error{m},0,2);
  mean_gini(:,m)=mean(Gini_error{m},2);
  std_gini(:,m)=std(Gini_error{m},0,2);
end 
save OOB_error OOB_error
save Gini_error Gini_error
save mean_oob mean_oob
save std_oob std_oob
save mean_gini mean_gini
save std_gini std_gini


