function fitness = calcFitnessRedundant(Xtemp,extPar,model)

fitness = 0;

for i = extPar.numTrials:-1:1
    pos = reshape(Xtemp,length(Xtemp)/3,3);
    j = randi(length(pos));
    pos(j,:) = [];
    pos = pos(:);
    fitness = fitness + calcFitness(pos,extPar,model);
end

fitness = fitness./extPar.numTrials;

end