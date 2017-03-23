% Kourosh Khademi Saysan
% ELEC459    
% LAB 4:  Identification of Discrete-Time Systems by Adaptive Filtering
% 
% Generating white noise sequence u(n)
% k : counter for the run number
function u = WhiteNoiseU(Nu,k)
randn('state',k*7)
u = randn(Nu,1);
m_u = mean(u);
u = u - m_u;
vr_u = var(u);
u = u/(sqrt(vr_u));

