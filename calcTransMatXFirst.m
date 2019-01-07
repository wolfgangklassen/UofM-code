function transMat = calcTransMatXFirst(pos)
%calcTransMat takes in a 3-by-numPos matrix of positions, and calculates
%the transformation matrix between the Bz field space and the gradient space.
%This function takes into account positioning errors, parametrized by
%posError.  This version calculates up to first order.

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

end