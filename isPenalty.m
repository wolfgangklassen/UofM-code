function isPenalty = isPenalty(pos,extPar)

rho = sqrt(pos(1).^2 + pos(2).^2);
z = pos(3);

if abs(z) > extPar.H
    isPenalty = true;
elseif rho > extPar.R2
    isPenalty = true;
elseif (abs(z)<30)&&(rho<50)%Magic numbers here for Ruediger
    isPenalty = true;
else
    isPenalty = false;
end

end