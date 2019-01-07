function transMat = calcTransMatErrors(pos,posError)
%calcTransMat takes in a 3-by-numPos matrix of positions, and calculates
%the transformation matrix between the field space and the gradient space.
%This function takes into account positioning errors, parametrized by
%posError.


x = pos(:,1) + posError.*(randn(length(pos),1));
y = pos(:,2) + posError.*(randn(length(pos),1));
z = pos(:,3) + posError.*(randn(length(pos),1));

transMat = zeros(length(pos),16);
transMat(:,1) = 1;
transMat(:,2) = y;
transMat(:,3) = z;
transMat(:,4) = x;
transMat(:,5) = 2.*x.*y;
transMat(:,6) = 2.*y.*z;
transMat(:,7) = z.*z - 0.5.*(x.*x + y.*y);
transMat(:,8) = 2.*x.*z;
transMat(:,9) = x.*x - y.*y;
transMat(:,10) = 3.*x.*z.*z - y.*y.*y;
transMat(:,11) = 6.*x.*y.*z;
transMat(:,12) = 3.*y.*z.*z - 0.75.*(x.*x.*y + y.*y.*y);
transMat(:,13) = z.*z.*z - 1.5.*z.*(x.*x + y.*y);
transMat(:,14) = 3.*x.*z.*z - 0.75.*(x.*x.*x + x.*y.*y);
transMat(:,15) = 3.*z.*(x.*x - y.*y);
transMat(:,16) = x.*x.*x - 3.*x.*y.*y;

end

