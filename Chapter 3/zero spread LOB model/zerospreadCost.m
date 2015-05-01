function C = zerospreadCost(T, N, Q, rho, c)
% 
% This function gives a trading strategy with the minimum cost under the
% zero spread Limit Order Book model presented in Alfonsi and Acevedo (2013).
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
%           Limit Order Book model with rho = 2 and c = 3, so
%
%           C = zerospreadCost(1, 20, 50, 2, 3)
%           C =
%               50.0000
%
% References:
%   Alfonsi, A. & Acevedo, J.I. (2013), Applied Mathematical Finance : 
%   Optimal Execution and Price Manipulations in Time-varying Limit Order 
%   Books, Applied Mathematical Finance. Available at:
%   http://dx.doi.org/10.1080/1350486X.2013.845471
%
%
% Copyright:
%   All rights are reserved by Xin Geng. 


% Set an equally spaced trading time interval. 
times=settime(T,N+1);

% The depth
q=depth(times, c);

% The symmetric matrix 'H' of the quadratic equation (16) in Alfonsi and
% Acevedo (2013).
H=setM(times,q,rho);

e=ones(N+1,1);
invM=inv(H);

% Optimal strategy. See equation (39) in Alfonsi and Acevedo (2013).
x = Q/(e'*invM*e)*(invM*e)

% Cost.
C = 1/2*x'*H*x;


z=1:N+1;
figure('Position',[300 300 800 400])
subplot('Position',[0.06 0.11 0.91 0.82])
hold on
bar(z,x)
plot(z,q,'-.')
hold off
xlabel('Time');
ylabel('Order size');

end
