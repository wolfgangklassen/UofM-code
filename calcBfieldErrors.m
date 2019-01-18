function Bmod = calcBfieldErrors(transMat,g,error,offset)
%calcBfieldErrors calculates Bx, By, and Bz using their various
%transformation matrices.  Then it calculates Bmod, then adds a sensor
%reading error, proportional to the "error" input.  An "offset" error can
%also be added, although this is typically set to zero, as it cannot efect
%the dFalse calculation.  This value, with errors added, is then reported
%as the output.  This value is later used as Bz for the purposes of fitting to
%the harmonic functions.

Bx = transMat(:,:,1)*g;
By = transMat(:,:,2)*g;
Bz = transMat(:,:,3)*g;

Bmod = sqrt(Bx.^2 + By.^2 + Bz.^2);
%Bmod = Bz;
err = error.*randn(length(Bmod),1);
Bmod = Bmod + err + offset;

end