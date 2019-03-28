function isPenalty = isPenalty(pos,extPar)

rho = sqrt(pos(1).^2 + pos(2).^2);
z = pos(3);

if abs(z) > extPar.H
    isPenalty = true;
elseif rho > extPar.R2
    isPenalty = true;
elseif (abs(z)<extPar.h2)&&(rho<extPar.R)
    isPenalty = true;
else
    isPenalty = false;
end

end