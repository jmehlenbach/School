% ELEC 459 LAB 4
% Tim Erdmer & Josh Mehlenbacher
% March 14, 2017

clear all;
close all;
clc;

% Generate the "unknown" filter length and cutoff frequency
M = 25; 
Mfilt = 21;
fc = 0.5; 
h =  fir1(Mfilt-1,fc); 

% Input number of case runs
NumberCases = 200;

% Specify length and variance of measurement noise signal v
N = 1800; 
sig2 = 1e-6;

% Specify length of pilot signal u
InputLength = N + M -1;

% Specify step size for LMA algorith μ
mu = 0.01;

% Preallocate average impulse response of the adaptive filter
w_avg = zeros(1,Mfilt);

% Preallocate average estimation error vector 
% This needs implementing
e_avg = zeros(1,N);

for i = 1: NumberCases
    % Generate Pilot Signal
    randn('state', i);
    u = randn(1,InputLength); 
    m = mean(u);
    u = u - m;
    vr = var(u);
    u = u/sqrt(vr);
    % Generate Measurement Noise Signal
    randn('state', i + NumberCases);
    v = randn(1,N);
    m = mean(v);
    v = v - m;
    vr = var(v);
    v = sqrt(sig2/vr)*v;
    w=zeros(1,Mfilt);
    
    x = zeros(1,N);
    y = zeros(1,N);
    d = zeros(1,N);
    e = zeros(1,N);
    
    for j = 1 : N
        u_hat = u(j+Mfilt-1:-1:j);
        
        x(j) = h*u_hat';
        
        d(j) = x(j) + v(j);
        
        y(j) = w*u_hat';
        
        e(j) = d(j) - y(j);
        
        w = w + (mu*e(j)*u_hat);

    end
  
    e_avg = e.^2 + e_avg;   
    w_avg = w_avg + w;
    
end

e_avg = e_avg/NumberCases;
w_avg = w_avg/NumberCases;
norm = sum(abs(wtest-w))/25;

figure(1);
semilogy(e_avg);

figure(2);
[H,w] = freqz(h,1,1024); 
[H2,w] = freqz(w_avg,1,1024);
plot(w/pi,20*log10(abs(H)),'b -x');
hold on;
plot(w/pi,20*log10(abs(H2)),'r -o');

