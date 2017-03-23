function [ output_args ] = assignment1( input_args )

%(a) Unit Sample
nn = -10:10;
xxa = nn == 0;
subplot (4,1,1),stem(nn,xxa);
legend('Unit Sample');
xlabel('(a)');
title('Josh Mehlenbacher');

%(b) Unit Step Function
xxa = nn >= 0;
subplot(4,1,2)
stem(nn,xxa)
legend('Unit Step')
xlabel('(b)')

%(c) Real Exponential Function
xxa = nn >= -3
subplot (4,1,3)
stem(nn,xxa.*exp(-.3*nn))
xlabel('(c)')
legend('Real Exponential');

%(d) Sinusoidal Function
subplot(4,1,4)
xxd = cos(pi*nn/5 - pi/4);
stem(nn,xxd)
xlabel('(d)')
legend('Sinusoidal');

end

%The biggest challenge was determining the values
%for each of the functions.
