% Version 1, 2017-09-17
% For CS229 Machine Learning, Lecture 01
%%
function J = cost_function(X,Y,theta)

%{
This is the least-square cost function that gives rise to the ordinary
least squares regression model.
%}

% # of data set
m = size(Y,1);

temp1 = hyp_fun_lin(X,theta)-Y;
temp2 = temp1'*temp1;
J = temp2/(2*m);
return
