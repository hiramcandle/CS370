global METHOD RT SP ST D HD AST

% global values
METHOD = 1;
RT = 0.25;
SP = 2.0;
ST = 1.0;
D = 0.001;
% HD = 0.01;
HD = 0.0001;
AST = 0.1;

% local values
y_0 = [0.0; 0.0; -pi; 5.0; 5.0; 0.0]; % pursuer | target
t_0 = 0.0;
t_f = 20.0;
tol = 0.000001;

% ode solver options
options = odeset('AbsTol', tol,'RelTol',tol,'MaxOrder',5,'Stats','on',...
    'events', 'on', 'Refine',4);

% solve odes
if METHOD == 1
  [t,y] = ode23('q5a_fun',[t_0,t_f],y_0,options);
else
  [t,y] = ode45('q5a_fun',[t_0,t_f],y_0,options);
end;

%
% Plot the trajectory of the pursuer and target
%
animate(t,y);