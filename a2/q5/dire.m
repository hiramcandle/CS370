function theta_dir = dire(x_t, y_t, x_p, y_p, theta_p)

%input:

% x_p  x-coord pursuer
% y_p  y-coord pursuer
% theta_p  direction of motion pursuer
             % (angle to x - axis, radians)

% x_t  x-coord target
% y_t  y-coord target

%output:
%  theta_dir direction from pursure to target
%                 (angle to x - axis, radians)

   x_diff = x_t - x_p;
   y_diff = y_t - y_p;
   
   theta_dir = atan2(  y_diff, x_diff);  %range [-pi, +pi]
   
   if( theta_dir < 0.0) 
       theta_dir = theta_dir + 2.*pi;  % now range  [0,2*pi]
   end

  theta_dir = theta_dir + 2*pi*floor( theta_p/(2.*pi) );
            % now, theta_dir is in the same interval as theta_pursuer,
            % k*2*pi <= theta_pursuer <= (k+1)*2*pi
            % k*2*pi <= theta_dir <= (k+1)*2*pi

%
%     make sure that we turn in the shortest
%    way to point in the right direction, i.e. we don't
%    turn the "long way round"

 if( (theta_p - theta_dir) > pi)
       theta_dir = theta_dir + 2*pi;
   elseif( theta_dir - theta_p > pi)
       theta_dir = theta_dir - 2*pi;
 end

    
 
     
