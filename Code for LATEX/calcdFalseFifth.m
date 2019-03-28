function dFalse = calcdFalseFifth(R,h1,h2,g)
% calcdFalse calulates the mercury contribution to the false EDM signal,
% given a precession volume with radius R in cm, height h1 in cm above the
%origin, and total height (h2-h1) in cm, and given the gradient vector g.
%This calculation assumes the gradient vector is given in units of 
%microtesla/cm^{ell}, where ell is the degree of the polynomial associated
%with the gradient term.  This version calculates up to fifth order.

dFalse = 8e-30*(R^2/4)*(g(6)*1e6 + g(12)*1e6*(h2+h1) - ...
    (g(20)*1e6/2)*(R^2 - 2*h1^2 - 2*h1*h2 - 2*h2^2) + ...
    (g(30)*1e-6)*((R.^2).*((h2^2 - h1^2)/(h2 - h1)) - (h2^4 - h1^4)/(h2 - h1)) + ...
    (g(42)*1e-6)*(-(h2^5 - h1^5)/(h2 - h1) + 5*((R^2)/3)*(h2^3 - h1^3)/(h2 - h1) - (5*R^6)/(16)));

end