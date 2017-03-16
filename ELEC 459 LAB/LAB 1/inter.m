function x_inter = inter(xd, K)

    Xd = fft(xd);
    Nd = length(Xd);
    
    if mod(Nd,2) > 0  % Nd odd
        N1 = (Nd+1)/2;
        Xe = [Xd(1:N1); zeros(K*Nd,1); Xd((N1+1):Nd)];
    else              % Nd even
        N2 = Nd/2;
        Xe = [Xd(1:N2);Xd(N2+1)/2;zeros(K*Nd-1,1);Xd(N2+1)/2;Xd((N2+2):Nd)];
    end
    Xe_i = ifft(Xe);
    x_inter = Xe_i*(K+1);
end