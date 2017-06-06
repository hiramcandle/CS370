function [err] = q2error(f_n, t, f_exact)
    f_n_exact = f_exact(t);
    err = f_n - f_n_exact;
end