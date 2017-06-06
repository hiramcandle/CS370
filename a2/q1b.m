function [z] = q1b(t, z_0)
	% Calculate denominator
	z_de = (z_0(1).^2 + z_0(2).^2).^(3/2);
	% Calculate z
	z_1 = z_0(3);
	z_2 = z_0(4);
	z_3 = (z_0(1) / z_de)*(-1);
	z_4 = (z_0(2) / z_de)*(-1);
	% Return
	z = [z_1; z_2; z_3; z_4]';
end
