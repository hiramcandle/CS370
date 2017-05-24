function [t] = calt(x,y)
    % Get length of point array
    Nx = length(x);
    Ny = length(y);
    if Nx < Ny 
        N = Ny;
    else
        N = Nx;
    end
    % Pre-allocate spaces
    t = zeros(1, N);
    % Calculate distance between 2 consecutive points
    for cur_idx = 2:N
        pre_idx = cur_idx - 1;
        x_d = x(cur_idx) - x(pre_idx);
        y_d = y(cur_idx) - y(pre_idx);
        d = sqrt(x_d.^2 + y_d.^2);
        t(cur_idx) = t(pre_idx) + d;
    end
end
