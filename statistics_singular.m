%% ���������ڼ���ʱƵ�׻�õ�����ֵ��ͳ��ѧ����
%% 0.׼��
clear
clc
close all
%% 1.��������
load(['ʱƵ�׵�����ֵ�ķֽ���.mat']);%singular��ÿһ�б�ʾһ���źŵ�����ֵ
%������������input_ML��������У��������500��105��
input_ML=[];
for i=1:500
%% 2.���������źŵ�ͳ��ѧ����
  %% 2.1 ����ƽ��ֵ
input_ML(i,1)=mean(singular(i,:));
  %% 2.2 ������λֵ
input_ML(i,2)=median(singular(i,:));  
  %% 2.3 �������ֵ
input_ML(i,3)=max(singular(i,:));  
  %% 2.4 ������Сֵ
input_ML(i,4)=min(singular(i,:));    
  %% 2.5 �����׼��
input_ML(i,5)=std(singular(i,:));  
  %% 2.6 ������
input_ML(i,6)=kurtosis(singular(i,:));  
  %% 2.7 ����б��
input_ML(i,7)=skewness(singular(i,:)); 
%% 3.�����������������ͳ��ѧ��������һ������Ϊ51������,�Ժ��ÿһ������Ϊ150���������ܹ�14�����䣩
%% 3.1 �����һ������
input_ML(i,8)=mean(singular(i,1:51));%ƽ��ֵ
input_ML(i,9)=median(singular(i,1:51));%��λֵ 
input_ML(i,10)=max(singular(i,1:51)); %���ֵ 
input_ML(i,11)=min(singular(i,1:51));%��Сֵ    
input_ML(i,12)=std(singular(i,1:51)); %��׼�� 
input_ML(i,13)=kurtosis(singular(i,1:51)); %��� 
input_ML(i,14)=skewness(singular(i,1:51));%б��
%% 3.2 ����ʣ�µ�13������
  for j=1:13
input_ML(i,14+1+7*(j-1))=mean(singular(i,(51+1+150*(j-1)):(51+150+150*(j-1))));%ƽ��ֵ
input_ML(i,14+2+7*(j-1))=median(singular(i,(51+2+150*(j-1)):(51+150+150*(j-1))));  %��λֵ 
input_ML(i,14+3+7*(j-1))=max(singular(i,(51+3+150*(j-1)):(51+150+150*(j-1))));% ���ֵ  
input_ML(i,14+4+7*(j-1))=min(singular(i,(51+4+150*(j-1)):(51+150+150*(j-1))));%  ��Сֵ    
input_ML(i,14+5+7*(j-1))=std(singular(i,(51+5+150*(j-1)):(51+150+150*(j-1))));%  ��׼�� 
input_ML(i,14+6+7*(j-1))=kurtosis(singular(i,(51+6+150*(j-1)):(51+150+150*(j-1))));%���   
input_ML(i,14+7+7*(j-1))=skewness(singular(i,(51+7+150*(j-1)):(51+150+150*(j-1))));% б��     
  end
end

%% 4.���������
save input_ML input_ML






  
  
  
  