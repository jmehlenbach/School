% Kourosh Khademi Saysan
% ELEC459    
% LAB 4:  Identification of Discrete-Time Systems by Adaptive Filtering
% 
% Generating zero-mean white nosie v(n)
function v = WhiteNoiseV(Nv,sig2,k)
randn('state', k*123)
v = randn(Nv,1);
m_v = mean(v);
v = v - m_v;
vr_v = var(v);
v = sqrt(sig2/vr_v)*v;