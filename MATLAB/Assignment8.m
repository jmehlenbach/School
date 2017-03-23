xlim([-5,5])
xlabel('x')

ylim([-5,5])
ylabel('y')
hold on;

X = [-5 -5 5 5 -5];

Y = [-5 5 5 -5 -5];




for n = 1:12
    view ([90,90]);
    axis square
    
   %set (gca, 'Xtick', -5:5, 'Ytick' , -5:5);
   g = line(X,Y,'color','r', 'Linewidth', 2);
    hold off;
    pause(0.5);
    camroll(30);
    
    
    
end

