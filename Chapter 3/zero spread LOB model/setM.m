function H=setM(times,q,rho)

% This function gives a symmetric matrix 'H' of the Matlab quadratic 
% programming function
%
% Last updated:
%   April 25th, 2015.
%
% Inputs:
%   times:      An equally spaced trading time interval.
%   q:          Time varying constant shape function.
%   rho:        Same side resilience rate.
%
% Outputs:
%   H:          symmetric matrix 'H' of the Matlab quadratic programming 
%               function x = quadprog(H,f,A,b,Aeq,beq,lb,ub,x0,options).
%
% Notes:
%   1. 'times' is a column vector.
%   2. 'q' and 'rho' are all scalars.
%
% Copyright:
%   All rights are reserved by Xin Geng. 

N=length(times);
H=zeros(N,N);

for i=1:N
    for j=1:N
        H(i,j)=exp(-abs(times(i)-times(j)) *rho)/q(min(i,j));
    end
end

end