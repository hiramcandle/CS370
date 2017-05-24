clear;
mdata=load('data.mat');
end_cond = 'variational'; % 1st Figure
%end_cond = 'not-a-knot'; % 2nd Figure

% plot heart
[px1, py1] = splinet(mdata.x(1:55), mdata.y(1:55), end_cond);
% plot 'L'
[px2, py2] = splinet(mdata.x(56:67), mdata.y(56:67), end_cond); 
% plot 'C'
[px3, py3] = splinet(mdata.x(68:83), mdata.y(68:83), end_cond);
% plot ampersand
[px4, py4] = splinet(mdata.x(84:105), mdata.y(84:105), end_cond);

hold on;
plot(px1, py1, 'b');
plot(px2, py2, 'b');
plot(px3, py3, 'b');
plot(px4, py4, 'b');
title('Q5 Part3 - Spline Interpolation');
axis off;
