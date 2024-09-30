% x values (started from 1 to avoid the singularity at 0)
x = linspace(1, 10, 100);

% function f(x) = 1/x
f = 1 ./ x;

% mesh grid for the surface of revolution
theta = linspace(0, 2*pi, 100);
[X, T] = meshgrid(x, theta);

%  surface of revolution using cylindrical coordinates
Z = 1 ./ X;
Y = Z .* sin(T);
Z = Z .* cos(T);

% Plot the surface
surf(X, Y, Z, 'EdgeColor', 'none', 'FaceColor', 'cyan')

% Enhance the plot
title("Gabriel's Horn (Torricelli's Trumpet)")
xlabel('X-axis')
ylabel('Y-axis')
zlabel('Z-axis')
axis tight
view([60, 30])
lighting phong
camlight headlight
