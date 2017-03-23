%b1 0.2209 b2...
b = [0.2209 -0.485 0.4503 -0.1527];
a = [1 0.0889 0.4039 0.0053];
[H,W]=freqz(b,a, 256); %returns N-point complex frequency response vector H and N-point frequency vector W in radians
plot(W,20*log10(abs(H))); %Plotting frequency vs amplitude



