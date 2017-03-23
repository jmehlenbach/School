Theta = 30/180*pi;                         % Angle of Rotation
w = [4 5]';                                % Coordinates of the rotation center. 

D = [0 6 5 1 3; 0 0 3 3 9];                % Coordinate Matrix for Point 1~5
figure; plot([D(1,1) D(1,5) D(1,2)],[D(2,1) D(2,5) D(2, 2)])