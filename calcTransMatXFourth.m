function transMat = calcTransMatXFourth(pos)
%calcTransMat takes in a 3-by-numPos matrix of positions, and calculates
%the transformation matrix between the Bz field space and the gradient space.
%This function takes into account positioning errors, parametrized by
%posError.  This version calculates up to fourth order.

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

transMat(:,25) = 4.*x.*y.*(x.^2 - y.^2);
transMat(:,26) = 12.*(x.^2).*y.*z - 4.*(y.^3).*z;
transMat(:,27) = x.*y.*(12.*(z.^2) - 3.*(x.^2) - y.^2);
transMat(:,28) = 2.*y.*z.*(2.*(z.^2) - 3.*(x.^2) - y.^2);
transMat(:,29) = x.*y.*(x.^2 + y.^2 - (8/3).*(z.^2));
transMat(:,30) = x.*z.*(1.5.*(y.^2 + x.^2) - 2.*(z.^2));
transMat(:,31) = z.^4 - 4.*(x.^2).*(z.^2) - (4/3).*(y.^2).*(z.^2) + ...
    0.5.*(x.^3).*z + 0.75.*(x.^2).*(y.^2) + 0.125.*y.^4;
transMat(:,32) = 4.*x.*z.*(x.^2 - z.^2);
transMat(:,33) = 6.*(x.^2).*(z.^2) - 1.25.*(x.^4) - 6.*(y.^2).*(z.^2) + ...
    1.5.*(x.^2).*(y.^2) + 0.75.*(y.^4);
transMat(:,34) = 4.*(x.^3).*z - 12.*x.*(y.^2).*z;
transMat(:,35) = x.^4 + y.^4 - 6.*(x.^2).*(y.^2);

end