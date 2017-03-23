% ELEC459    LAB 4:  Identification of Discrete-Time Systems by Adaptive
% Filtering
% 
% Generating white noise sequence u(n)
Nu = 1824;
randn('state',7)
u = randn(Nu,1);
m_u = mean(u);
u = u - m_u;
vr_u = var(u);
u = u/(sqrt(vr_u));

% Generating zero-mean white nosie v(n)
sig2 = exp(-4);
Nv = 1800;
randn('state', 123)
v = randn(Nv,1);
m_v = mean(v);
v = v - m_v;
vr_v = var(v);
v = sqrt(sig2/vr_v)*v;

% %Constructing FIR LP filter
M1 = 21;
fc = 0.5;
h = fir1(M1-1,fc);
[H,w] = freqz(h,1,1024);
plot(w/pi,20*log10(abs(H)))
axis([0 1 0 -100 10])
grid on

% Generating Output x(n) and Desired response d(n)
x = h'
