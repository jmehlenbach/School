 M = 21; 
fc = 0.5; 
h =  fir1(M-1,fc); 
%input number of case runs
NumberCases = 200;
%specify length and variance of measurement noise signal v
N = 1800; 
sig2 = 1e-6;
%Specify length of pilot signal u
InputLength = N + M -1;
%Specify step size for LMA algorith μ
mu = 0.01;
%Preallocate average impulse response of the adaptive filter
w_avg = zeros(1,M);
%Preallocate average estimation error vector 
%This needs implementing
e_avg = zeros(1,N);
for i = 1: NumberCases
    randn('state', i); 
    u = randn(1,InputLength); 
    m = mean(u);
    u = u - m;
    vr = var(u);
    u = u/sqrt(vr); 
    randn('state', i + NumberCases); 
    v = randn(1,N);
    m = mean(v);
    v = v - m;
    vr = var(v);
    v = sqrt(sig2/vr)*v;
    w=zeros(1,N);
end

e_avg = e_avg/NumberCases;
w_avg = w_avg/NumberCases;

semilogy(e_avg);
[H,w] = freqz(h,1,1024); 
plot(w/pi,20*log10(abs(H))); 