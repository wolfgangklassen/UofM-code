function Bmod = calcBfield(transMat,g)
%calcBfieldErrors calculates Bx, By, and Bz using their various
%transformation matrices.  Then it calculates Bmod, which is then reported
%as the output.  This value is later used as Bz for the purposes of fitting to
%the harmonic functions. transMat is a vector of 3 transformation matrices, one for each
%dimension
%edit

Bx = transMat(:,:,1)*g;
By = transMat(:,:,2)*g;
Bz = transMat(:,:,3)*g;

Bmod = sqrt(Bx.^2 + By.^2 + Bz.^2);

end