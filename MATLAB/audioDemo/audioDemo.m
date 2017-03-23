% This program does the following:
%     1) Load the specified audio signal.
%     2) Optionally applies a filtering operation to the audio signal.
%     3) Computes and plots the frequency spectrum of the audio signal.
%     4) Plays the (possibly filtered) audio signal on the audio device.

% Step 0: Select an audio signal.
% Below are the names of various audio signals defined in this code.
% Uncomment the name of whichever signal you want to use.
%name = 'train';
name = 'splat';
%name = 'noisyHandel';

% Step 1: Load the audio signal.
[samps, sampFreq] = getAudioSignal(name);
disp(sprintf('Signal Name: %s', name));
disp(sprintf('Number of samples: %d', length(samps)));
disp(sprintf('Sampling frequency (Hz): %f', sampFreq));

% Step 2: Apply a filtering operation to the audio signal.
% Several examples of applying filtering operations to the signal
% are included below.  Uncomment whichever one you want to use.
%samps = applyFilter(samps, sampFreq, 'lowpass', 1500);
%samps = applyFilter(samps, sampFreq, 'highpass', 1500);
%samps = applyFilter(samps, sampFreq, 'bandpass', [500 1500]);
%samps = applyFilter(samps, sampFreq, 'bandstop', [2950 3550]);

% Step 3: Compute and plot the frequency spectrum of the audio signal.
freqSpect(samps, sampFreq);

% Step 4: Play the audio signal on the audio device (until the user
% begs us to stop)
while 1
	soundsc(samps, sampFreq);
	buf = input('Play audio signal again (y/n)?', 's');
	if (~strcmpi(buf, 'y'))
		break
	end
end

% If you want to save the audio data to a WAV file...
% Save audio signal in audio file.
% wavwrite(samps, sampFreq, 16, '../output/file.wav');

