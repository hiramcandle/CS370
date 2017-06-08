function [dP,halt,direction] = q5a_fun(t,P,flag)
% P is position 6-d vector [x_p, y_p, theta_p, x_t, y_t, theta_t]
% dP is the change of P

global RT SP ST D HD AST

pp = [P(1); P(2); P(3)]; % pursuer position
tp = [P(4); P(5); P(6)]; % target position
% calculate distance between pursuer and target
dp = tp - pp;
distance = norm([dp(1) dp(2)], 2);

if nargin<3 | isempty(flag)
  % calculate theta_d
  theta_d = dire(P(4), P(5), P(1), P(2), P(3));
  % calculate pursuer position change
  dP(1) = SP*cos(P(3));
  dP(2) = SP*sin(P(3));
  dP(3) = SP*((theta_d - P(3) / (abs(theta_d - P(3)) + D)));
  % calculate target position change
  dP(4) = ST*cos(P(6));
  dP(5) = ST*sin(P(6));
  dP(6) = ST/RT*AST;
  dP = dP';
  
elseif strcmp(flag,'events')
  dP = distance-HD;
  halt = 1;
  direction = 0;
end;
