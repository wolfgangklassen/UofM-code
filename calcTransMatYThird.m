function transMat = calcTransMatYThird(pos)
%calcTransMat takes in a 3-by-numPos matrix of positions, and calculates
%the transformation matrix between the Bz field space and the gradient space.
%This function takes into account positioning errors, parametrized by
%posError.  This version calculates up to third order.

x = pos(:,1);
y = pos(:,2);
z = pos(:,3);

transMat = zeros(length(pos),48);
transMat(:,1) = 1;
transMat(:,2) = 0;
transMat(:,3) = 0;

transMat(:,4) = x;
transMat(:,5) = z;
transMat(:,6) = -0.5*y;
transMat(:,7) = 0;
transMat(:,8) = -y;

transMat(:,9) = x.^2 - y.^2;
transMat(:,10) = 2.*x.*y;
transMat(:,11) = 0.25.*(x.^2 + 3.*y.^2 - 4.*z.^2);
transMat(:,12) = -y.*z;
transMat(:,13) = -0.5.*x.*y;
transMat(:,14) = -2.*y.*z;
transMat(:,15) = -2.*x.*y;

transMat(:,16) = x.^3 - 3.*x.*y.^2;
transMat(:,17) = 3.*((x.^2).*z - (y.^2).*z);
transMat(:,18) = -0.5.*(x.^3 + 3.*x.*(y.^2) - 6.*x.*(z.^2));
transMat(:,19) = -0.25.*(3.*(x.^2).*z + 9.*(y.^2).*z - 4.*z.^3);
transMat(:,20) = (3/8).*((x.^2).*y + y.^3 - 4.*y.*(z.^2));
transMat(:,21) = -1.5.*x.*y.*z;
transMat(:,22) = -3.*y.*(z.^2) + y.^3;
transMat(:,23) = -6.*x.*y.*z;
transMat(:,24) = -3.*(x.^2).*y + y.*3;

end