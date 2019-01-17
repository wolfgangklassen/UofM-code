function pos = genPos()
%genPos is used when a specific and parameterizable layout of magnetometers
%is desired.  There are no inputs to this function, and the output is a
%16-by-3 matrix of positions.


pos = zeros(16,3);
r = 0.25;
delta = 0;
angle = 0;

for i = 1:8
    angle = angle + delta;
    pos(i,1) = r*cos(angle);
    pos(i,2) = r*sin(angle);
    pos(i,3) = 0.3*(i/8);
    r = r + 0.01;
    delta = delta + pi/16;
end

r = 0.25;
delta = 0;
angle = pi/3;

for i = 1:8
    angle = angle - delta;
    pos(i+8,1) = r*cos(angle);
    pos(i+8,2) = r*sin(angle);
    pos(i+8,3) = -0.3 + 0.3*(i/8);
    r = r + 0.01;
    delta = delta + pi/7;
end

end