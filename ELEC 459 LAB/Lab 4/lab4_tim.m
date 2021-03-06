% ELEC 459 LAB 4
% Tim Erdmer & Josh Mehlenbacher
% March 14, 2017

clear all;
close all;
clc;

% Generate the "unknown" filter length and cutoff frequency
M = 21; 
fc = 0.5; 
h =  fir1(M-1,fc); 

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
w_avg = zeros(1,M);

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
    w=zeros(1,M);
    
    x = zeros(1,N);
    y = zeros(1,N);
    d = zeros(1,N);
    e = zeros(1,N);
    
    u_hat = u(i:(i+M-1));
    
    x = h*u_hat';
    
    d = x + v;
    
    y = w*u_hat';
    
    e = d - y;
    
    w = w + (mu*e(i)*u_hat);
    
    e_square = e.*e;
    
    e_avg = e_avg + e_square;
    
    w_avg = w_avg + w;
    
end

e_avg = e_avg/NumberCases;
w_avg = w_avg/NumberCases;

figure(1);
semilogy(e_avg);

figure(2);
[H,w] = freqz(h,1,1024); 
plot(w/pi,20*log10(abs(H))); 


