% Copyright (c) 2009 Michael D. Adams
%
% applyFilter
%
% Apply a lowpass/highpass/bandpass filter to a signal.
%
% Input arguments:
%     f           The samples of the signal to be filtered.
%     sampFreq    The sampling frequency.
%     type        The type of filtering operation (expressed as a string).
%                 Valid types are 'lowpass', 'highpass', and 'bandpass'.
%     parms       A vector of parameters for the filter.
%                 For a lowpass or highpass filter, the vector has only one
%                 element, which is the cutoff frequency.
%                 For a bandpass or bandstop filter, the vector has two
%                 elements, which are the two cutoff frequencies.
%
% Output arguments:
%     g    The samples of the filtered signal.

function g = applyFilter(f, sampFreq, type, parms)

nyquistFreq = sampFreq / 2;

switch type
case 'lowpass'
	if parms(1) <= 0 | parms(1) >= nyquistFreq
		error('Invalid cutoff frequency.');
	end
	cutoffFreq = parms(1) / nyquistFreq;
	[b, a] = butter(10, cutoffFreq, 'low');
	h = filtfilt(b, a, [zeros(1, 50) 1 zeros(1, 50)]);
case 'highpass'
	if parms(1) <= 0 | parms(1) >= nyquistFreq
		error('Invalid cutoff frequency.');
	end
	cutoffFreq = parms(1) / nyquistFreq;
	[b, a] = butter(10, cutoffFreq, 'high');
	h = filtfilt(b, a, [zeros(1, 50) 1 zeros(1, 50)]);
case 'bandpass'
	if parms(1) <= 0 | parms(1) >= nyquistFreq
		error('Invalid cutoff frequency.');
	end
	if parms(2) <= 0 | parms(2) >= nyquistFreq
		error('Invalid cutoff frequency.');
	end
	cutoffFreq0 = parms(1) / nyquistFreq;
	cutoffFreq1 = parms(2) / nyquistFreq;
	[b, a] = butter(10, [cutoffFreq0 cutoffFreq1]);
	h = filtfilt(b, a, [zeros(1, 50) 1 zeros(1, 50)]);
case 'bandstop'
	if parms(1) <= 0 | parms(1) >= nyquistFreq
		error('Invalid cutoff frequency.');
	end
	if parms(2) <= 0 | parms(2) >= nyquistFreq
		error('Invalid cutoff frequency.');
	end
	cutoffFreq0 = parms(1) / nyquistFreq;
	cutoffFreq1 = parms(2) / nyquistFreq;
	[b, a] = butter(10, [cutoffFreq0 cutoffFreq1], 'stop');
	h = filtfilt(b, a, [zeros(1, 50) 1 zeros(1, 50)]);
otherwise
	error('unknown filter type');
end

g = conv(f, h);

