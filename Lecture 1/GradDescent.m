function [theta,J_his,flag] = GradDescent(X,Y,theta0,alpha,N_step,tol)
% Initial guess
theta = theta0;
% # of Iteration 
iter = 1;
% Maximum # of iteration 
% initial cost function
J = cost_function(X,Y,theta);
% History track of cost function
J_his = NaN(N_step,1);
J_his(iter)=J;
% The difference between two continuous cost function
% Initial value can be any value larger than tol
delta = 100;
% flag = 1 mean that the algorithm converges
flag = 1;
% # of data set
m = size(X,1);

while delta>=tol
    if iter<=N_step
        fprintf('%i    %e \n',iter,J);
        
        temp1 = hyp_fun_lin(X,theta);
        temp2 = temp1 - Y;

        temp3 = temp2'*X;

        theta = theta - alpha/m*temp3';

        J = cost_function(X,Y,theta); 

        delta = abs(J-J_his(iter));

        iter = iter +1;

        J_his(iter)=J;
        
        
    else
        % # of Iteration eceed the N_step 
        flag = -1;
        break
    end
end

return