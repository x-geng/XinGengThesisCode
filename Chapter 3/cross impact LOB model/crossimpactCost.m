function C = crossimpactCost(T, N, Q, rho, beta, c)

% This function gives a trading strategy with the minimum cost under the
% cross impact Limit Order Book model.
%
% Last updated:
%   April 25th, 2015.
%
% Inputs:
%   T:          Upper bound of the trading time interval [0, T].
%   N:          Number of tradings in the interval [0, T]. The first 
%               trading occurs at time 0. The last trading occurs at time T.
%   Q:          Trading volumes or number of traded shares.
%   rho:        Same side resilience rate.
%   beta:       Opposite side resilience rate.
%   c:          Depth function. 
%
% Output:
%   C:          Minimum cost under the cross impact Limit Order Book model.
%
% Notes:
%   1. 'T', 'N', 'Q', 'rho', 'beta' and 'c' are all scalars.
%   2. The value of 'c' can only be 1, 2, 3 or 4. 
%       *****************************************
%       *  Value of c   *   The depth function  *
%       *****************************************
%       *       1       *       Increasing      *
%       *       2       *       Decreasing      *
%       *       3       *       Reverting       *
%       *       4       *       Constant        *
%       *****************************************
%
% Examples: Consider Q = 50 shares of stocks need to be traded within time 
%           interval [0,1] and N = 20 trades. Suppose the cross impact 
%           Limit Order Book model with rho = 2, beta=10, and c = 1, so
%
%           C = crossimpactCost(1, 20, 50, 2, 10, 3)
%           C =
%               50.0000
%
% Copyright:
%   All rights are reserved by Xin Geng. 



% Set an equally spaced trading time interval. 
times = settime(T,N+1);

% The depth.
depthfunction = depth(times,c);

% The symmetric matrix 'H' of the Matlab quadratic programming function
% 'quadprog'.
H = setM(times,depthfunction,rho,beta);

% Lower bounds of the trading strategy.
lb = zeros(2*N+2,1);

% Linear coefficients 'Aeq' and constant vector 'beq' of the Matlab
% quadratic programming function 'quadprog'.
[Aeq,beq] = construct_eq(N+1,Q);

options = optimset('Algorithm','active-set');

% Optimal strategy.
x = quadprog(H,lb,[],[],Aeq,beq,lb,[],[],options);

% Cost.
C = 1/2*x'*H*x;

display(Aeq*x);


z = 1:N+1;
y = netstrategy(x,N+1);
figure('Position',[300 300 800 400])
subplot('Position',[0.06 0.11 0.91 0.82])
set(gca,'fontsize',15)
hold on
bar(z,y)
plot(z,depthfunction,'-.')
hold off
xlabel('Time');
ylabel('Order size');

% alfonsi=[21;5.6;0;0;30;25;0;0;1.8;30;0;0];

end