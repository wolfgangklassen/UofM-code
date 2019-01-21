function posCell = genPosCell(cell,pos)
%genPosCell generates a list of positions that are within a cylindrical
%volume with radius "cell.radius" and a hieght/depth of "cell.height",
%centered on the input position "pos".  cell.numPosRadius/cell.radius
%describes the density of points along the x and y axis,
%cell.numPosHeight/cell.height describes the density of points along the z
%axis.

x = linspace(pos(1) - cell.radius,pos(1) + cell.radius,cell.numPosRadius);
y = linspace(pos(2) - cell.radius,pos(2) + cell.radius,cell.numPosRadius);
z = linspace(pos(3) - cell.height,pos(3) + cell.height,cell.numPosHeight);
[X,Y,Z] = ndgrid(x,y,z);
grid = [X(:),Y(:),Z(:)];

posCell = grid((((grid(:,1) - pos(1)).^2 + (grid(:,2) - pos(2)).^2) < cell.radius),:);


end