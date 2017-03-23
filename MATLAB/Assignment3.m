function [ output_args ] = Assignment3( input_args )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
b=[-0.5, 1, 0.5];
a=[1,0.5,0.25];
omega = linspace(-pi,pi, 1024);
[h,w] = freqz(b,a,omega);
subplot(1,2,1);
plot(w/pi, abs(h));
xlabel('omega/pi');
ylabel('magnitue response');
subplot(1,2,2);
plot(w/pi,unwrap(angle(h)));
xlabel ('omega/pi');
ylabel ('phase respnse');
 help stem
 


end

