% Copyright (c) 2009 Michael D. Adams
%
% cardinalSine
%
% Compute the cardinal sine (i.e., sinc) function as it is defined
% in the coursepack.
%
% Input arguments:
%     x    The matrix of values at which to evaluate the sinc function.
%
% Output arguments:
%     y    The computed values for the sinc function.
%
% NOTE: This function is different from the MATLAB sinc function!!!

function y = cardinalSine(x)

i = find(x == 0);                                                              
x(i)= 1;
y = sin(x) ./ (x);                                                     
y(i) = 1;   

