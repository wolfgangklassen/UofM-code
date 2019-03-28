function CN = calcConditionNumber(Xtemp,extPar)

pos = reshape(Xtemp,numel(Xtemp)./3,3);
M = calcTransMatZThird(pos);
CN = cond(M);

end