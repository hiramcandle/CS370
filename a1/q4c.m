%clear figure
clf;

% points
x = [1 2 4 6 8];
y = [2 2 1 4 3];

% piecewise function values
x1 = 1:0.01:2;
x2 = 2:0.01:4;
x3 = 4:0.01:6;
x4 = 6:0.01:8;
y1 = -35/164*x1.^3+105/164*x1.^2-35/82*x1+2;
y2 = 99/328*x2.^3-201/82*x2.^2+236/41*x2-87/41;
y3 = -121/328*x3.^3+459/82*x3.^2-1084/41*x3+1673/41;
y4 = 57/328*x4.^3-171/41*x4.^2+1319/41*x4-3133/41;

% plot curves
title('Q4(c) Spline Graph');
xlabel('X axis') % x-axis label
ylabel('Y axis') % y-axis label
hold on;
plot(x1,y1,'b');
plot(x2,y2,'b');
plot(x3,y3,'b');
plot(x4,y4,'b');
% plot points alone
plot(x,y,'o', ... 
    'MarkerSize',5, ...
    'MarkerEdgeColor','g', ...
    'MarkerFaceColor','g');

