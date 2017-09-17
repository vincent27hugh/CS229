function [Xnorm,mu,sigma]=normalization(X)
% Normalize the data X
% output: 
% Xnorm - normalized DATA
% mu - the mean value vector of each feature of X
% sigma - the std vector of each feature of X

% # of data set
m = size(X,1);

% mean value of each column of X
temp1 = mean(X,1);
mu = temp1(2:end);

temp2 = std(X,1);
sigma = temp2(2:end);

Xnorm = [ones(m,1),(X(:,2:end)-repmat(mu,m,1))./repmat(sigma,m,1)];

return