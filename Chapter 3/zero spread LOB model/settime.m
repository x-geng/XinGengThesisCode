function times=settime(T,N)

%This function sets an equally spaced trading time interval.
%
% Last updated:
%   April 25th, 2015.
%
% Inputs:
%   T:      upper bound of the trading time interval [0, T].
%   N:      Number of tradings in the interval [0, T]. The first trading occurs
%           at time 0. The last trading occurs at time T.
%
% Outputs:
%   times:  a column vactor which stores trading times.
%
% Examples:
%   Consider a stock traded 3 times in the time interval [0,1]. So
%
%   times = settime(1,3)
%   times = 
%         0
%       0.5
%       1.0
%
% Notes:
%   All inputs can only be a scalar.
%
% Copyright:
%   All rights are reserved by Xin Geng. 


h=T/(N-1);
times=zeros(N,1);

for i=1:N
    times(i)=(i-1)*h;
end


end