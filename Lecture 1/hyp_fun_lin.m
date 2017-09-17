function h = hyp_fun_lin(X,theta)
% linear hypothesis function
% if n is the # of features and m is # of data
% nX is m*(n+1) matrix and 
h = X*theta;
return