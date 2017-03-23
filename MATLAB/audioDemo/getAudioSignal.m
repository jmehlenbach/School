% Copyright (c) 2009 Michael D. Adams
%
% getAudioSignal
%
% Gets one of a number of predefined audio signals.
%
% Input arguments:
%     name    The name of the audio signal (expressed as a string).
%             Valid values include the following:
%             'chirp', 'handel', 'splat', 'gong', 'laughter', 'train',
%             'noise', 'a440'
%
% Output arguments:
%     samps       The samples of the audio signal.
%     sampFreq    The sampling frequency (in Hz).

function [samps, sampFreq] = getAudioSignal(name)

maxSamps = -1;

if nargin == 0
	error('You must specify a signal name');
end

switch name
case 'chirp'
	load chirp
	samps = y;
	sampFreq = Fs;
case 'handel'
	load handel
	samps = y;
	sampFreq = Fs;
case 'noisyHandel'
	load handel
	sampFreq = Fs;
	nyquistFreq = sampFreq / 2;
	samps = y;
	a = 0.5 * max(abs(samps));
	noise = a * randn(size(samps));
	noise = applyFilter(noise, sampFreq, 'bandpass', [0.7324 0.8545] * nyquistFreq);
	noise = noise(1 : length(samps));
	samps = samps + noise;
case 'splat'
	load splat
	samps = y;
	sampFreq = Fs;
case 'gong'
	load gong
	samps = y;
	sampFreq = Fs;
case 'laughter'
	load laughter
	samps = y;
	sampFreq = Fs;
case 'train'
	load train
	samps = y;
	sampFreq = Fs;
case 'sin'
	sampFreq = 1000;
	sampPer = 1 / sampFreq;
	t = [0 : sampPer : 5 ];
	alpha = 200;
	samps = cos(2 * pi * alpha * t);
case 'simple'
	sampFreq = 8192;
	sampPer = 1 / sampFreq;
	t = [0 : sampPer : 5 ];
	alpha = 1000;
	gamma = 0.5;
	beta = 0;
	samps = gamma * ones(size(t));
	while 1 
		beta = beta + alpha;
		if beta >= 0.9 * sampFreq / 2
			break
		end
		samps = samps + sin(2 * pi * beta * t);
	end
case 'noise'
	sampFreq = 8192;
	samps = 2 * (randn(1, sampFreq * 5) - 0.5);
case 'sin440'
	sampFreq = 8000;
	t = [0 : (1 / sampFreq) : 3];
	samps = sin(2 * pi * 440 * t);
case 'square500'
	sampFreq = 8000;
	samps = gensig('square', 1 / 500, 2, 1 / sampFreq);
case 'test'
	sampFreq = 10;
	t = [0 : (1 / sampFreq) : 4];
	samps = sin(2 * pi * 1 * t);
end

numSamps = length(samps);
if maxSamps > 0 & numSamps > maxSamps
	samps = samps(1 : maxSamps);
	numSamps = maxSamps;
end

