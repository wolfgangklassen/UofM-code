function pos = genPos()
%genPos is used when a specific and parameterizable layout of magnetometers
%is desired.  There are no inputs to this function, and the output is a
%16-by-3 matrix of positions.


pos = zeros(20,3);
r = 25;
delta = pi/5;
phi = pi/50;
zdelta = 1;
rdelta = 2;
angle = 0;
z = 30;

for i = 1:10
    pos(i,1) = r*cos(angle);
    pos(i,2) = r*sin(angle);
    pos(i,3) = z;
    angle = angle + delta;
    z = z + zdelta;
    delta = delta + phi;
    r = r + rdelta;
end

r = 30;

angle = pi/19;
delta = pi/6;
phi = pi/40;
zdelta = 1.5;
rdelta = 2.5;
z = -35;

for i = 1:10
    pos(i+10,1) = r*cos(angle);
    pos(i+10,2) = r*sin(angle);
    pos(i+10,3) = z;
    z = z - zdelta;
    angle = angle - delta;
    delta = delta + phi;
    r = r + rdelta;
end

pos = reshape(pos,numel(pos),1)

end