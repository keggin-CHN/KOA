
% ----------------------- README ------------------------------------------
%   Author and programmer: Reda Mohamed & Mohamed Abdel-Basset
%   Main paper:
%               Kepler optimization algorithm: A new metaheuristic algorithm
%               inspired by Kepler laws of planetary motion
% -------------- 最后一次修改：2023/1/3 -----------------------------------
% -------------------  欢迎关注₍^.^₎♡  ------------------------------------
% -------------- 项目：Kepler optimization algorithm (KOA) ----------------
% -------------- 微信公众号：KAU的云实验台(可咨询定制) --------------------
% -------------- CSDN：KAU的云实验台 --------------------------------------
% -------------- 付费代码(更全)：https://mbd.pub/o/author-a2iWlGtpZA== ----
% -------------- 免费代码：公众号后台回复"资源" ---------------------------
% -------------------------------------------------------------------------

% The Kepler Optimization Algorithm 再注释版

%% 清空
clear all
clc
close all

%% 函数选择
Function_name = 'F9';% 测试函数
disp(strcat('------ CEC2017测试函数: ',Function_name))

%% 测试函数获取
[lb,ub,dim,fobj] = Get_CEC2017_details(Function_name,30);

%% 基本参数
SearchAgents_no=100; % 种群量级
Max_iteration=500; % 迭代次数
lb= lb.*ones( 1,dim );
ub= ub.*ones( 1,dim );

%% 函数寻优
[Curve,fitness,chrom] = KOA(SearchAgents_no,Max_iteration,ub,lb,dim,fobj);
disp '------------ KOA完成 --------------------------- '

%% 结果
figure('Position',[269   240   660   290])
subplot(1,2,1);
[x,y,f] = CEC2017_plot(Function_name);
surfc(x,y,f,'LineStyle','none');hold on
title('Parameter space')
xlabel('x_1');
ylabel('x_2');
zlabel([Function_name,'( x_1 , x_2 )'])

subplot(1,2,2);
plot(Curve,'Color','r','LineWidth',2)
title('Objective space')
xlabel('Iteration');
ylabel('Best score obtained so far');
axis tight
grid on
box on
legend('KOA')

display(['The best solution obtained by KOA is : ', num2str(chrom)]);
display(['The best optimal value of the objective funciton found by KOA is : ', num2str(fitness)]);


