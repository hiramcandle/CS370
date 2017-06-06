% clear figure
clf;

% initial values
t_0 = 0;
t_f = 4;
N = 40;
y_0 = 1;
h = (t_f - t_0) / N;

% calculate Y
y = MidpointRule(@q2func, t_0, t_f, N, y_0);
t = t_0:h:t_f;

% plot
hold on;
plot(t, y);
plot(t, y, '.');
title('Q2(c) MidpointRule');