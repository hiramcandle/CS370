% clear figure
clf;

% initial values
t_0 = 0;
t_f = 4;
N = 40;
y_0 = 1;
h = (t_f - t_0) / N;

% calculate Y
t = t_0:h:t_f;
len = length(t);
y = zeros(len);
for i = 1 : len
   y(i) = q2func_exact(t(i));
end
y_n = ForwardEuler(@q2func, t_0, t_f, N, y_0);

% plot
hold on;
plot(t, y);
plot(t, y_n, '.');
title('Q2(b) ForwardEuler');
