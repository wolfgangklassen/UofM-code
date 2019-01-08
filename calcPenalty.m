function penalty = calcPenalty(pos,extPar)

penalty = 0;
x = 0;
for i = 1:length(pos(:,1))
    
    r = sqrt(pos(i,1).^2 + pos(i,2).^2 + pos(i,3).^2);
    rho = sqrt(pos(i,1).^2 + pos(i,2).^2);
    z = pos(i,3);
    
    if isequal([z>extPar.H,rho<extPar.R2],[1,1])
        x = z - extPar.H;
    elseif isequal([z<extPar.H,rho>extPar.R2],[1,1])
        x = rho - extPar.R2;;
    elseif isequal([z>extPar.H,rho>extPar.R2],[1,1])
        x = r - sqrt(extPar.R2.^2 + extPar.H.^2);
    elseif isequal([z<extPar.h2,rho<extPar.R],[1,1])
        if z < rho
            x = (extPar.R./rho).^5 - 1;
        else
            x = (extPar.h2/z).^5 - 1;
        end
    end
    
    penalty = penalty + (1+x).^4
    
end



end