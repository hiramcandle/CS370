% clear figure
clf;

% initial values
t_0 = 0;
t_f = 2*pi;
N = 500000;
z_0 = [0.4 0.0 0.0 2.0];

% calculate Z
Z = ForwardEuler(@q1b, t_0, t_f, N, z_0);
z_x = Z(:, 1);
z_y = Z(:, 2);

% plot
hold on;
plot(z_x, z_y);
title('Q1(c) Verify Ellipse');
