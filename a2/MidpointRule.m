function [y] = MidpointRule (f, t_0, t_f, N, y_0)
    % allocate space
    y = zeros(N+1, length(y_0));
	y(1, :) = y_0';
    % calculate h
	h = (t_f - t_0) / N;
    % iterate
	for n = 1:N
		t = t_0 + (n-1) * h;
		k_1 = f(t, y_0) * h;
        k_2 = f(t+h/2, y_0+k_1/2) * h;
        y_0 = y_0 + k_2;
		y(n+1, :) = y_0';
	end
end