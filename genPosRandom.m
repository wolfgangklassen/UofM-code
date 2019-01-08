function pos = genPosRandom(R,H,numPos)
%genPosRandom generates numPos random positions within a radius R of the
%z-axis, and between H/2 and -H/2.  input is (number,number, number),
%output is a 3-by-numPos array of positions.

pos = zeros(numPos,3);

for i = 1:numPos
    
    angle = rand*2*pi;
    r = rand*R;
    
    pos(i,1) = r*cos(angle);
    pos(i,2) = r*sin(angle);
    pos(i,3) = rand*H-(H/2);
    
end

end
