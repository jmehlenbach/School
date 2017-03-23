% Kourosh Khademi Saysan
% ELEC459    
% LAB 4:  Identification of Discrete-Time Systems by Adaptive Filtering
% 
%Constructing FIR LP filter as Unknown System
function h = Unknown(M1,fc)
h = fir1(M1-1,fc);
[H,w] = freqz(h,1,1024);
plot(w/pi,20*log10(abs(H)))
%axis([0 1 0.1 0 -100 10])
grid on