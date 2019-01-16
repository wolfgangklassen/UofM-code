function penalty = calcPenalty(pos,extPar)

penalty = 0;
x = 0;
for i = 1:length(pos(:,1))
    
    r = sqrt(pos(1).^2 + pos(2).^2 + pos(3).^2);
    rho = sqrt(pos(1).^2 + pos(2).^2);
    z = pos(3);
    
    if isequal([z>extPar.H,rho<extPar.R2],[1,1])
        x = z - extPar.H;
    elseif isequal([z<extPar.H,rho>extPar.R2],[1,1])
        x = rho - extPar.R2;
    elseif isequal([z>extPar.H,rho>extPar.R2],[1,1])
        x = r - sqrt(extPar.R2.^2 + extPar.H.^2);
    elseif isequal([z<extPar.h2,rho<extPar.R],[1,1])
        if z < rho
            x = (extPar.R./rho).^10 - 1;
        else
            x = (extPar.h2/z).^10 - 1;
        end
    end
    
    penalty = penalty + (1+x).^4;
    
end



end