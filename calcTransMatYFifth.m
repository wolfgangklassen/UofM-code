function transMat = calcTransMatYFifth(pos)
%calcTransMat takes in a 3-by-numPos matrix of positions, and calculates
%the transformation matrix between the Bz field space and the gradient space.
%This function takes into account positioning errors, parametrized by
%posError.  This version calculates up to fifth order.

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

transMat(:,25) = y.^4 - 6.*(x.^2).*(y.^2) + x.^4;
transMat(:,26) = 4.*(x.^3).*z - 12.*x.*(y.^2).*z;
transMat(:,27) = 6.*(x.^2).*(z.^2) - 0.75.*(x.^4) - 1.5.*(x.^2).*(y.^2) - ...
    6.*(y.^2).*(z.^2) + (4/5).*(y.^4);
transMat(:,28) = 2.*x.*z.*(2.*(z.^2) - x.^2 - 3.*(y.^2));
transMat(:,29) = z.^4 - (4/3).*(x.^2).*(z.^2) - (8/3).*(y.^2).*(z.^2) + ...
    0.125.*(x.^4) + 0.75.*(x.^2).*(y.^2) + (5/8).*(y.^4);
transMat(:,30) = y.*z.*(1.5.*(x.^2 + y.^2) - 2.*(z.^2));
transMat(:,31) = x.*y.*(0.5.*(x.^2 + y.^2) - (8/3).*(z.^2));
transMat(:,32) = 4.*y.*z.*(y.^2 - z.^2);
transMat(:,33) = -12.*x.*y.*(z.^2) + (x.^3).*y + 3.*x.*(y.^3);
transMat(:,34) = 4.*(y.^3).*z - 12.*(x.^2).*y.*z;
transMat(:,35) = 4.*x.*y.*(y.^2 - x.^2);

transMat(:,36) = x.^5 - 10.*(x.^3).*(y.^2);
transMat(:,37) = 5.*z.*(y.^4 + x.^4 - 6.*(x.^2).*(y.^2));
transMat(:,38) = 10.*(x.^3).*(z.^2) - 30.*x.*(y.^2).*(z.^2) + 5.*x.*(y.^4);
transMat(:,39) = (25/2).*(x.^2).*(z.^3) - (5/4).*(x.^4).*z - ...
    (15/6).*(x.^2).*(y.^2).*z - (75/6).*(y.^2).*(z.^3) + (25/12).*(y.^4).*z;
transMat(:,40) = (35/8).*x.*(z.^4) - (25/4).*(x.^3).*(z.^2) - ...
    (75/4).*x.*(y.^2).*(z.^2) - (5/16).*(x.^5) - (25/16).*x.*(y.^4) - ...
    (15/8).*(x.^3).*(y.^2);
transMat(:,41) = z.^5 - 2.5.*(x.^2).*(z.^3) - (15/2).*(y.^2).*(z.^3) + ...
    (5/8).*(x.^4).*z + (25/8).*(y.^4).*z + (15/4).*(x.^2).*(y.^2).*z;
transMat(:,42) = -2.5.*y.*(z.^4) + (15/4).*(y.^3).*(z.^2) + ...
    (15/4).*(x.^2).*y.*(z.^2) - (5/16).*(x.^4).*y - (5/8).*(x.^2).*(y.^3) - ...
    (5/16).*(y.^5);
transMat(:,43) = -7.*x.*y.*(z.^3) + 0.5.*x.*(y.^3).*z + 0.5.*(x.^3).*y.*z;
transMat(:,44) = -(5/8).*(x.^2).*(y.^3) + (5/16).*(x.^4).*y - 5.*y.*(z.^4) + ...
    10.*(y.^3).*(z.^2) - (15/16).*(y.^5);
transMat(:,45) = 5.*x.*y.*z.*(x.^2 + 3.*(y.^2) - 4.*(z.^2));
transMat(:,46) = 10.*(y.^3).*(z.^2) + 5.*(x.^2).*(y.^3) + (5/2).*(x.^4).*y - ...
    1.5.*(y.^5) - 30.*(x.^2).*y.*(z.^2);
transMat(:,47) = 20.*x.*y.*z.*(y.^2 - x.^2);
transMat(:,48) = y.^5 - 5.*y.*(x.^4) + 10.*(y.^3).*(x.^2);

end