function ret_ang = anglenormalize(theta)

while (theta < 0)
    theta = theta + 2*pi;
end
while (theta >= 2*pi)
    theta = theta - 2*pi;
end

ret_ang = theta;