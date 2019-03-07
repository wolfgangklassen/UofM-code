function pos = genPos()
%genPos is used when a specific and parameterizable layout of magnetometers
%is desired.  There are no inputs to this function, and the output is a
%16-by-3 matrix of positions.


pos = zeros(20,3);
r = 25;
delta = pi/5;
angle = 0;

for i = 1:10
    angle = angle + delta;
    pos(i,1) = r*cos(angle);
    pos(i,2) = r*sin(angle);
    pos(i,3) = 30;
end

r = 25;

angle = pi/10;

for i = 1:10
    angle = angle + delta;
    pos(i+10,1) = r*cos(angle);
    pos(i+10,2) = r*sin(angle);
    pos(i+10,3) = -30;
end

pos = reshape(pos,numel(pos),1)

end