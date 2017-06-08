function [dP,halt,direction] = q5d_fun(t,P,flag)
% P is position 6-d vector [x_p, y_p, theta_p, x_t, y_t, theta_t]
% dP is the change of P

global RT SP ST D HD AST DANG

disp(t);

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
  % calculate turning angle change of target
  n_theta_p = anglenormalize(P(3));
  n_theta_t = anglenormalize(P(6));
  if n_theta_p > n_theta_t
      n_diff_theta = n_theta_p - n_theta_t;
  else
      n_diff_theta = n_theta_t - n_theta_p;
  end
  DANG = abs(DANG - n_diff_theta);

%   disp(n_diff_theta);
  
  
%   if distance > 0.7 * RT
%       % First stage
%       if n_diff_theta < 0.15
%           AST = -0.14;
%       elseif n_diff_theta > 2*pi-0.15
%           AST = 0.14;
%       end 
%       
%   else
%       % Second stage
%       if n_diff_theta < 1.1
%           AST = -1;
%       elseif n_diff_theta > 2*pi-1.1
%           AST = 1;
%       end
%   end

% if n_diff_theta < 0.05
% %     AST = 0.045599999;
%     AST = n_diff_theta * 1.1399975 + DANG * 0.01;
% end
% 
  if distance > 1.5 * RT
      % First stage
      if n_diff_theta < 0.15
          AST = -0.14;
      elseif n_diff_theta > 2*pi-0.15
          AST = 0.14;
      end 
      
  else
      % Second stage  
      AST = n_diff_theta * 1.1399975 + 0.5 * DANG;
      if AST > 1
          AST = 1;
      elseif AST < -1
          AST = -1;
      end
  end
  
if (abs(AST) > 1)
    assert(false);
end



% if SWITCH == 2
%   if n_diff_theta < 0.15
%       if n_diff_theta < 0.1
%           AST = -0.14;
%       else
%           AST = -0.14;
%       end
%           
%   elseif n_diff_theta > 2*pi-0.15
%       if n_diff_theta < 0.1
%           AST = 0.15;
%       else
%           AST = 0.15;
%       end
%   end
% end


  dP(6) = ST/RT*AST;
  dP = dP';
  
elseif strcmp(flag,'events')
  dP = distance-HD;
  halt = 1;
  direction = 0;
end;