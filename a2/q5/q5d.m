global METHOD RT SP ST D HD AST
% global values
METHOD = 1; % 1 => ode15s; otherwise => ode45
RT = 0.25;
SP = 2.0;
ST = 1.0;
D = 0.001;
HD = 0.01;
AST = 0;

% local values
y_0 = [0.0; 0.0; -pi; 5.0; 5.0; 0.0]; % pursuer | target
t_0 = 0.0;
t_f = 40.0;
tol = 0.000001;

% ode solver options
options = odeset('AbsTol', tol,'RelTol',tol,'MaxOrder',5,'Stats','on',...
    'events', 'on', 'Refine', 4);

% solve odes
if METHOD == 1
  [t,y,te,ye,ie] = ode15s('q5d_fun',[t_0,t_f],y_0,options);
else
  [t,y,te,ye,ie] = ode45('q5d_fun',[t_0,t_f],y_0,options);
end;

% plot the trajectory of the pursuer and target
% animate(t,y);

% plot the trajectory of the pursuer
figure(2);
plot(y(:, 1), y(:, 2));
axis([-2 16 0 9]);
title('The Trajectory of the Pursuer');
xlabel('x(t)'); % x-axis label
ylabel('y(t)'); % y-axis label

% plot the trajectory of the target
figure(3);
plot(y(:, 4), y(:, 5));
axis([-2 16 0 9]);
title('The Trajectory of the Target');
xlabel('x(t)'); % x-axis label
ylabel('y(t)'); % y-axis label

% plot the trajectory of both
figure(4);
hold on;
plot(y(:, 1), y(:, 2));
plot(y(:, 4), y(:, 5), '--');
title('The Trajectory of the Pursuer and Target');
xlabel('x(t)'); % x-axis label
ylabel('y(t)'); % y-axis label

% show hitting time
disp('Hitting time: ');
disp(te);
