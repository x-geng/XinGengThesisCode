function [A,Abar,Atilde]=setMatrix(times,q,rho,beta)

% This function returns three matrix to the function 
% 'setM(times,q,rho,beta)'. These matrix are listed in page 86 of my PhD
% thesis, which are 'A', '\bar{A}' and '\tilde{A}'.
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
%   A:          Matrix 'A'.
%   Abar:       Matrix '\bar{A}'.
%   Atilde:     Matrix '\tilde{A}'.
%
% Notes:
%   1. 'times' is a column vector.
%   2. 'q', 'rho', 'beta' are all scalars.
%
% Copyright:
%   All rights are reserved by Xin Geng. 


N = length(times);

A = zeros(N,N);
Atilde = zeros(N,N);
Abar = zeros(N,N);

for i = 1:N
    for j = 1:N
        A(i,j) = (i<j)*exp(-(times(j)-times(i)) *rho)/q(i);
        Atilde(i,j) = (i<j)*exp(-(times(j)-times(i)) *(rho+beta))/q(i);
        Abar(i,j) = (i<j)*exp(-(times(j)-times(i)) *rho)/q(i)+0.5*(i==j)*exp(-(times(j)-times(i)) *rho)/q(i);
    end
end

end