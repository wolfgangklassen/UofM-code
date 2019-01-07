function gDip = calcGradDipole(disp,dip)
%calcGradDipole calculates the gradient vector associated with a dipole
%with azimuthal angle 'az', inclination 'inc', magnitude 'mag', and at
%position 'r'.  input is in cm to match the rest of the programs, output
%will be uT/(cm)^ell to match as well.  Internal numbers must all be SI.
load('I.mat')
load('order.mat')

numPoints = 40;
x = linspace(-0.5,0.5,numPoints);
y = linspace(-0.5,0.5,numPoints);
z = linspace(-0.5,0.5,numPoints);
[X,Y,Z] = ndgrid(x,y,z);
pos = [X(:),Y(:),Z(:)];

Bdip = zeros(numPoints^3,3);

for i = 1:numPoints^3
    Bdip(i,:) = calcBfieldDipole(dip,disp,pos(i,:)); 
end
Tx = calcTransMatXFifth(pos);
Ty = calcTransMatYFifth(pos);
Tz = calcTransMatZFifth(pos);

T = [Tx;Ty;Tz];

B = [Bdip(:,1);Bdip(:,2);Bdip(:,3)];

gDip = calcGrad(B,T);

end