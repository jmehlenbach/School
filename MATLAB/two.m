denominator=[1 -1 0.25]; %z^2 -z+0.25
numerator= [1 0 0];
u=ones(1,41);
v=[0 40 0 5];
axis(v);
k=0:40;
x=filter(numerator,denominator,u);
plot(k,x,'*');
xlabel('k');
ylabel('x(k)');
title('Step Response');

