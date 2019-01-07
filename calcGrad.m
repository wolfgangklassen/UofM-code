function g_fit = calcGrad(B,transMat)
%calcGrad is essentially a wrapper around the "pinv" function, to
%make my other code more readable.  This also allows modifications to be
%made in the future to how this is done. edit

g_fit = pinv(transMat)*B;

end