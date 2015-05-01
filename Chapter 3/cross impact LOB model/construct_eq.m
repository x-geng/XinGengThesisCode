function [Aeq,beq]=construct_eq(N,Q)

% This function gives linear coefficients 'Aeq' and constant vector 'beq' in 
% the constraint Aeq*x = beq of the Matlab quadratic programming function
% x = quadprog(H,f,A,b,Aeq,beq,lb,ub,x0,options).
%
% Last updated:
%   April 25th, 2015.
%
% Inputs:
%   N:      Number of trading times.
%   Q:      Trading volumes or number of traded shares.
%
% Outputs:
%   Aeq:    Linear coefficients in the constraints Aeq*x = beq.
%   beq:    Constant vector in the constraints Aeq*x = beq.
%
% Notes:
%   All inputs can only be a scalar.
%
% Copyright:
%   All rights are reserved by Xin Geng. 



a = ones(1,N);
b = -1.*a;

Aeq = [a,b];   % one row
beq = Q;
end