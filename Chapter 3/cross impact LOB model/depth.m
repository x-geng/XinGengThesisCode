function y=depth(times, c)

% This function defines the time varying constant shape function.
% 
% Last updated:
%   April 25th, 2015.
%
% Inputs:
%   times:  A column vector which stores trading times.
%   c:      Depth function. 
%
% Outputs:
%   y:      A column vector which stores depth at each trading time.
%
% Notes:
%   1. The value of 'c' can only be 1, 2, 3 or 4.
%       *****************************************
%       *  Value of c   *   The depth function  *
%       *****************************************
%       *       1       *       Increasing      *
%       *       2       *       Decreasing      *
%       *       3       *       Reverting       *
%       *       4       *       Constant        *
%       *****************************************
%   2. 'times' can be a scalar or a column vector.
%
% Examples:
%   Consider an increasing depth function in 3 equally distanced trading times in [0,1]. So
%
%   y = depth([0; 0.5; 1.0], 1)
%   y = 
%      1
%      2
%      3
%
% Copyright:
%   All rights are reserved by Xin Geng. 


%
% Four types depth functions, determined by value of c.
%
switch c
    case 1 % increasing depth function
        y=2*times+1;
        
    case 2 % decreasing depth function
        y=2./(0.5+times);
        
    case 3 % reverting depth function
        y=2+cos(2*pi*times);
        
    case 4 % constant depth function
        y=5*ones(1,length(times));
end

end