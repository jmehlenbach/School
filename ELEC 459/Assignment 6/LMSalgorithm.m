%Assignment 6 Elec 459
%Josh Mehlenbacher V00735261

N = 4096;
Sig1 = 0.27;
Sig2 = 0.1;;
randn ('state',1);
v1 = randn (N,1);
m = mean (v1);
v1 = v1 - m;
s = sum (v1.^2)/N;
v1 = sqrt(Sig1/s)*v1;
randn ('state',7);
v2 = randn (N,1);
m = mean (v2);
v2 = v2 -m;
s = sum (v2.^2)/N;
v2 = sqrt(Sig2/s)*v2;
d = zeros (N+1,1);
x = zeros (N+2,1);
for i = 1:N,
    d(i+1) = -0.8458*d(i) +v1(i);
    x(i+2) = 0.1*x(i+1) +0.8*x(i) +v1(i);
end
d=d(2:(N+1));
x=x(3:(N+2));
u = x+v2;
u = [0;u];

%Added 
wk = w0(:);
y = zeros(N,1);
e = zeros (N,1);
W = wk;
for i=1:N,
    uvi = [u(i+1) u(i)]';
    y(i) = wk'*uvi;
    e(i) = d(i) -y(i);
    w_new = wk + (mu*e(i))*uvi;
    wk = w_new;
    W=[W wk];
end
figure (1);
plot(W')

grid
axis([0 4096 -1.2 1.2])

w0_lms = mean (W(1,1000:4097));
w1_lms = mean (W(2,1000:4097));