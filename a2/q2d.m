% initial values
y_0 = 1;
t_0 = 0;
t_f = 4;
N = zeros(11, 1);
for i = 0:10
    N(i+1) = 2.^i*10;
end
% calculate errors
error = zeros(11, 1);
for i = 1:11
    y = ForwardEuler(@q2func, t_0, t_f, N(i), y_0);
    f_n = y(N(i) + 1);
    error(i) = q2error(f_n, t_f, @q2func_exact);
end
disp('Error:');
disp(error);
% calculate error ratios & p-values
error_ratio = zeros(10, 1);
p_val = zeros(10, 1);
for i = 1:10
    error_ratio(i) = error(i + 1) / error(i);
    p_val(i) = log2(1 / error_ratio(i));
end
disp('Error Ratio:');
disp(error_ratio);
disp('p:')
disp(p_val);