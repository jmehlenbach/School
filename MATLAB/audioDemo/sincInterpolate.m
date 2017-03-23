% Copyright (c) 2009 Michael D. Adams
%
% sincInterpolate
%
% Perform sinc interpolation in the spirit of the sampling theorem.
%
% Input arguments:
%     samps       The samples of the signal to be interpolated.
%     sampFreq    The sampling frequency (in Hz).
%     t           The time instants at which to compute the signal.
%
% Output arguments:
%     x           The computed signal values.

function x = sincInterpolate(samps, sampFreq, t)

x = zeros(size(t));
samps = samps(:);
t = t(:);

numSamps = length(samps);
numTimes = length(t);

n = [0 : (numSamps - 1)];
for i = 1 : numTimes
	x(i) = cardinalSine(pi * sampFreq * t(i) - pi * n) * samps;
end

