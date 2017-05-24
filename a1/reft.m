function [rt] = reft(t)
    N = length(t);
    rt = zeros(1, 5*(N-1)+1);
    % Refine
    for k = 1:N-1
        i = 5*(k-1)+1;
        dt = t(k+1) - t(k);
        rt(i) = t(k);
        rt(i+1) = t(k) + dt/5;
        rt(i+2) = t(k) + 2*dt/5;
        rt(i+3) = t(k) + 3*dt/5;
        rt(i+4) = t(k) + 4*dt/5;
    end
    % Last one
    rt(5*(N-1)+1) = t(N);
end
