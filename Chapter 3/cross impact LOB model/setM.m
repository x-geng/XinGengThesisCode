function H=setM(times,q,rho,beta)

% This function gives a symmetric matrix 'H' of the Matlab quadratic 
% programming function
% x = quadprog(H,f,A,b,Aeq,beq,lb,ub,x0,options).
%
% Last updated:
%   April 25th, 2015.
%
% Inputs:
%   times:      An equally spaced trading time interval.
%   q:          Time varying constant shape function.
%   rho:        Same side resilience rate.
%   beta:       Opposite side resilience rate.
%
% Outputs:
%   H:          symmetric matrix 'H' of the Matlab quadratic programming 
%               function x = quadprog(H,f,A,b,Aeq,beq,lb,ub,x0,options).
%
% Notes:
%   1. 'times' is a column vector.
%   2. 'q', 'rho', 'beta' are all scalars.
%
% Copyright:
%   All rights are reserved by Xin Geng. 


[A,Abar,Atilde] = setMatrix(times,q,rho,beta); 
% [A,Abar,Atilde] = setMatrix2(times,q,rho,beta);

B = 0.5*(Abar'+Abar);
D = A-Atilde;

Mbar = [B, -D; -D, B];

H = Mbar'+Mbar;

end