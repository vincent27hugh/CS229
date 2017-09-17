% Version 1, 2017-09-17
% For CS229 Machine Learning, Lecture 01
%%
clear 
close all
%% Input Data
% For Mac, set your working path
path0 = strcat('/Users/huwei/Documents/Github/CS229/Lecture 1');
cd(path0);

% Loading Data
data = load('ex1data2.txt');
% data = load('ex1data2.txt');
%{
% Living area
LA = data(:,1);
% # Bedrooms
NB = data(:,2);
% Price (1000$s)
PR = data(:,3);
%}
% PR
Y = data(:,end);
% # of training examples
m = numel(Y);
% [LA,NB]
% Add a column of one to X
X = [ones(m,1),data(:,1:end-1)];
% # of features
n = size(X,2);
%% Plot 3d data 
f1 = figure;
subplot(1,2,1);
stem3(X(:,2),X(:,3),Y);
xlabel('Living Area','FontSize',18);
ylabel('# of Bedrooms','FontSize',18);
zlabel('Price (1000$s)','FontSize',18);
title('House Price~Living area&#Bedrooms-before normalization','FontSize',18);
%% Normalization
[Xnorm,mu,sigma]=normalization(X);
%% Plot data 
subplot(1,2,2);
stem3(Xnorm(:,2),Xnorm(:,3),Y);
xlabel('Living Area-Normalized','FontSize',18);
ylabel('# of Bedrooms-Normalized','FontSize',18);
zlabel('Price (1000$s)','FontSize',18);
title('House Price~Living area&#Bedrooms-after normalization','FontSize',18);
str_title = 'Plot of house price';
% Maximize figure size
set(gcf,'Position',get(0,'ScreenSize'));
savefig(gcf,str_title);
saveas(gcf,str_title,'jpg');
close(f1);
%% Gradient Descent
% We use search algorithm that starts with some "initial guess"
% Initialize parameter vector, AKA weight factor
theta0 = zeros(n,1);
% learning rate
alpha = 0.1;
% Maximum iteration number
N_step = 1e3;
% Tolerence of error
tol = 1e-6;
% Gradient Descent
[theta,J_his,flag] = GradDescent(Xnorm,Y,theta0,alpha,N_step,tol);
% 
