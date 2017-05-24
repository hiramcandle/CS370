clear;
mdata=load('data.mat');

hold on;
title('Q5 Part2 - Join Data Points with Straight Lines');
xlabel('X axis'); % x-axis label
ylabel('Y axis'); % y-axis label

plot(mdata.x(1:55), mdata.y(1:55), 'b'); % plot heart
plot(mdata.x(56:67), mdata.y(56:67), 'b'); % plot 'L'
plot(mdata.x(68:83), mdata.y(68:83), 'b'); % plot 'C'
plot(mdata.x(84:105), mdata.y(84:105), 'b'); % plot ampersand

grid on;
