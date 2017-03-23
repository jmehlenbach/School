% Copyright (c) 2009 Michael D. Adams
%
% freqSpect
%
% Compute the frequency spectrum of a bandlimited signal from its samples
% assuming that the signal was sampled at a rate satisfying the Nyquist
% condition.
%
% Input arguments:
%     samps       The samples of the signal (with the first sample
%                 corresponding to the one at time zero).
%     sampFreq    The sampling frequency (in Hz).
%
% Output arguments:
%     spect    The computed spectrum.
%     freqs    The frequencies (in Hz) at which the spectrum is evaluated.
%
% Note: If the output arguments are not used, the results are plotted
% in a figure.

function [spect, freqs] = freqSpect(samps, sampFreq, freqs)

if ~isvector(samps)
	error('Invalid signal samples.');
end
if sampFreq <= 0
	error('Invalid sampling frequency');
end

nyquistFreq = sampFreq / 2;
if nargin < 3
	freqs = linspace(-nyquistFreq, nyquistFreq, 500);
end

samps = samps(:);
numSamps = length(samps);
numFreqs = length(freqs);

spect = zeros(numFreqs);
normFreqs = freqs / sampFreq;
n = [0 : (numSamps - 1)];
v = -j * 2 * pi * n;
for i = find(normFreqs >= -0.5 & normFreqs <= 0.5)
	%spect(i) = exp(-j * 2 * pi * normFreqs(i) * n) * samps;
	spect(i) = exp(normFreqs(i) * v) * samps;
end
spect = spect / sampFreq;

if nargout == 0

	% Plot the results.

	len = numSamps / sampFreq;
	magSpect = abs(spect);
	phaseSpect = angle(spect);

	if numSamps < 500
		t = linspace(-0.05 * len, 1.05 * len, numSamps);
		x = sincInterpolate(samps, sampFreq, t);
	else
		t = [0 : (numSamps - 1)] / sampFreq;
		x = samps;
	end

	subplot(3, 1, 1);
	plot(t, x);
	title('Signal');
	xlabel('Time (s)');
	ylabel('Value');

	subplot(3, 1, 2);
	plot(freqs, magSpect);
	title('Magnitude Spectrum');
	xlabel('Frequency (Hz)');
	ylabel('Magnitude');

	subplot(3, 1, 3);
	plot(freqs, phaseSpect);
	title('Phase Spectrum');
	xlabel('Frequency (Hz)');
	ylabel('Angle (rad)');

	% Play the data as an audio signal.
	% soundsc(samps, sampFreq);

end

