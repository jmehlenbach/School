%%
% ELEC 459
% Lab 1
% Experiment 2 - Applications of DFT in Signal Detection and Interpolation
% Timothy Erdmer
% V00732662
% January 23rd, 2017
% Group # 4
%%

clear all;
close all;
clc;

load xn;
load handel;

signal = xn;


Fs_2 = 128;
T = 1/Fs_2;
L = 1793;
t = (0:L-1)*T;

signal_fft = fft(signal);
P2 = abs(signal_fft / L);
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);
f = Fs_2*(0:(L/2))/L;

figure(1);
plot(signal);
title('Time Domain Representation of x[n]');
xlabel('n (samples)');
ylabel('X(n)');

figure(2);
plot(f,P1);
title('Frequency Domain Representation of x[n]');
xlabel('f (Hz)');
ylabel('X(f)');

%%

s1 = signal(1:128);

L = length(s1);
t = (0:L-1)*T;

s1_fft = fft(s1);
P2 = abs(s1_fft / L);
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);
f = Fs_2*(0:(L/2))/L;

figure(3);
plot(f,P1);
title('Magnitude Spectrum of x[1:128]');
xlabel('f (Hz)');
ylabel('X(f)');
%%
s2 = signal(1:256);

L = length(s2);
t = (0:L-1)*T;

s2_fft = fft(s2);
P2 = abs(s2_fft / L);
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);
f = Fs_2*(0:(L/2))/L;

figure(4);
plot(f,P1);
title('Magnitude Spectrum of x[1:256]');
xlabel('f (Hz)');
ylabel('X(f)');
%%
s3 = signal(1:512);

L = length(s3);
t = (0:L-1)*T;

s3_fft = fft(s3);
P2 = abs(s3_fft / L);
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);
f = Fs_2*(0:(L/2))/L;

figure(5);
plot(f,P1);
title('Magnitude Spectrum of x[1:512]');
xlabel('f (Hz)');
ylabel('X(f)');

%%

s4 = signal(1:1024);

L = length(s4);
t = (0:L-1)*T;

s4_fft = fft(s4);
P2 = abs(s4_fft / L);
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);
f = Fs_2*(0:(L/2))/L;

figure(6);
plot(f,P1);
title('Magnitude Spectrum of x[1:1024]');
xlabel('f (Hz)');
ylabel('X(f)');

%%
s5 = signal(1:1792);

L = length(s5);
t = (0:L-1)*T;

s5_fft = fft(s5);
P2 = abs(s5_fft / L);
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);
f = Fs_2*(0:(L/2))/L;

figure(7);
plot(f,P1);
title('Magnitude Spectrum of x[1:1792]');
xlabel('f (Hz)');
ylabel('X(f)');

%% 2.4.4 
signal_split_fft = zeros(14, 128);

L2 = 14;
k = 1792 / L2;

for i = 1:L2
    signal_split_fft(i,:) = fft(signal(1+((i-1)*k):k+((i-1)*k)));
end
    
sig_fft_avg = sum(signal_split_fft).';

P2 = abs(sig_fft_avg / k);
P1 = P2(1:k/2+1);
P1(2:end-1) = 2*P1(2:end-1);
f = Fs_2*(0:(k/2))/k;

figure(8);
plot(f,P1);
title('Magnitude Spectrum of DFT-Averaged Signal');
xlabel('f (Hz)');
ylabel('X(f)');

%%

%handel_sig = y;
N = 20000;

x = y(1:N);
x2 = x(1:2:N);
x3 = x(1:3:N);
x4 = x(1:4:N);

x_inter2 = inter(x2,1);
x_inter3 = inter(x3,2);
x_inter4 = inter(x4,3);

diff2 = x - x_inter2;
diff3 = x - x_inter3(1:20000);
diff4 = x - x_inter4;

norm2 = norm(diff2);
norm3 = norm(diff3);
norm4 = norm(diff4);

figure(9);
plot(x(1:50),'bo');
hold on;
plot(x_inter2(1:50),'rx');
legend('Original','Interpolated');
title('x inter2 K=1');
xlabel('Samples x[n]');
ylabel('X[n]');

figure(10);
plot(x(1:50),'bo');
hold on;
plot(x_inter3(1:50),'rx');
legend('Original','Interpolated');
title('x inter3 K=2');
xlabel('Samples x[n]');
ylabel('X[n]');

figure(11);
plot(x(1:50),'bo');
hold on;
plot(x_inter4(1:50),'rx');
legend('Original','Interpolated');
title('x inter4 K=3');
xlabel('Samples x[n]');
ylabel('X[n]');



