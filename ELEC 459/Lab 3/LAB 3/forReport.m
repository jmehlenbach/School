clear all;
close all;
clc;

load homework.mat;
load homework_if.mat;

homework_orig = homework;
homework_noisy = homework_if;

homework_f = zeros(400,760);


% choosing row 200, where only interference information is visible

row_200 = homework_noisy(200,:);
figure(1);
imshow(row_200,[]);

row_200_fft = fft(row_200);

row_abs = abs(row_200_fft);

Fs = 10000;
T = 1/Fs;
L = length(row_200);
t = (0:L-1)*T;

P2 = abs(row_200_fft / L);
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);
f = Fs*(0:(L/2))/L;

figure(2);
plot(f,P1);

wc = 0.18158
% wc = 0.18421
diff = 0.0375
filtlength = 121

h = win_fourier(filtlength,4,[(wc - diff) (wc+diff)],2);

figure(3);
freqz(h);

for i = 1:400
    x_temp = conv(homework_noisy(i,:),h,'same');
    homework_f(i,:) = x_temp;
    for j = 1:760
       if homework_f(i,j) < 0
           homework_f(i,j) = 0;
       elseif homework_f(i,j) > 255
           homework_f(i,j) = 255;           
       end       
       if homework_orig(i,j) < 0
           homework_orig(i,j) = 0;
       elseif homework_orig(i,j) > 255
           homework_orig(i,j) = 255;
       end
    end
end

e_before = norm(homework_noisy - homework_orig,'fro')/norm(homework_orig,'fro')

e_after = norm(homework_f - homework_orig,'fro')/norm(homework_f,'fro')


figure(4);
subplot(3,1,1);
imshow(homework_orig,[]);
subplot(3,1,2);
imshow(homework_noisy,[]);
subplot(3,1,3);
imshow(homework_f,[]);

figure(5);
imshow(homework_f,[]);
