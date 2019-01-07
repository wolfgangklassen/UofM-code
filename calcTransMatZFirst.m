function transMat = calcTransMatZFirst(pos)
%calcTransMat takes in a 3-by-numPos matrix of positions, and calculates
%the transformation matrix between the Bz field space and the gradient space.
%This function takes into account positioning errors, parametrized by
%posError.  This version calculates up to first order.

x = pos(:,1);
y = pos(:,2);
z = pos(:,3);

transMat = zeros(length(pos),8);
transMat(:,1) = 0;
transMat(:,2) = 1;
transMat(:,3) = 0;

transMat(:,4) = 0;
transMat(:,5) = y;
transMat(:,6) = z;
transMat(:,7) = x;
transMat(:,8) = 0;

end