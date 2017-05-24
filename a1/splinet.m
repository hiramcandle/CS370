function [px, py] = splinet(x, y, end_cond)
    t = calt(x, y);
    % Cubic spline interpolation
    csx = csape(t, x, end_cond);
    csy = csape(t, y, end_cond);
    rt = reft(t);
    % Evaluate
    px = ppval(csx, rt);
    py = ppval(csy, rt);
end
