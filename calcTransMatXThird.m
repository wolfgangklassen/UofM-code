function transMat = calcTransMatXThird(pos)
%calcTransMat takes in a 3-by-numPos matrix of positions, and calculates
%the transformation matrix between the Bz field space and the gradient space.
%This function takes into account positioning errors, parametrized by
%posError.  This version calculates up to third order.

x = pos(:,1);
y = pos(:,2);
z = pos(:,3);

transMat = zeros(length(pos),24);
transMat(:,1) = 0;
transMat(:,2) = 0;
transMat(:,3) = 1;

transMat(:,4) = y;
transMat(:,5) = 0;
transMat(:,6) = -0.5.*x;
transMat(:,7) = z;
transMat(:,8) = x;

transMat(:,9) = 2.*x.*y;
transMat(:,10) = 2.*y.*z;
transMat(:,11) = -0.5.*x.*y;
transMat(:,12) = -x.*z;
transMat(:,13) = -0.25.*(3.*x.^2 + y.^2 - 4.*z.^2);
transMat(:,14) = 2.*x.*z;
transMat(:,15) = x.^2 - y.^2;

transMat(:,16) = 3.*(x.^2).*y - y.^3;
transMat(:,17) = 6.*x.*y.*z;
transMat(:,18) = -0.5.*(3.*(x.^2).*y + y.^3 - 6.*y.*(z.^2));
transMat(:,19) = -1.5.*x.*y.*z;
transMat(:,20) = (3/8).*(x.^3 + x.*(y.^2) - 4.*x.*(z.^2));
transMat(:,21) = -0.25.*(9.*(x.^2).*z + 3.*(y.^2).*z - 4.*(z.^3));
transMat(:,22) = -x.^3 + 3.*x.*(z.^2);
transMat(:,23) = 3.*((x.^2).*z - (y.^2).*z);
transMat(:,24) = x.^3 - 3.*x.*(y.^2);

end