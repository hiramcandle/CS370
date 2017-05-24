clear;
mdata=load('data.mat');

hold on;
title('Q5 Part1');
xlabel('X axis'); % x-axis label
ylabel('Y axis'); % y-axis label

% axes('position', [0.1, 0.1, 0.8, 0.8]); % setup the axes
% axis equal; % Tip: use axis equal to avoid scaling issues

plot(mdata.x, mdata.y, '*');
grid on;