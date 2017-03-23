function Q2_Octagon(n)
hold off
x = [-5, 5];
y = [0,0];
plot (x,y)
hold on;
plot (y,x)
axis square
set(gca, 'xtick', -5:5, 'ytick', -5:5);
title(['iteration' num2str(n)])
r = 5;
a = ((0:0.25:2) + 0.025n)*pi;
plot (r*cos(a), r*sin(a))
end

