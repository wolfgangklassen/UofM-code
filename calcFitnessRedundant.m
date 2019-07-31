function fitness = calcFitnessRedundant(Xtemp,extPar,model)

fitness = 0;

for i = length(Xtemp)/3:-1:1
    pos = reshape(Xtemp,length(Xtemp)/3,3);
    pos(i,:) = [];
    pos = pos(:);
    fitness = fitness + calcFitness(pos,extPar,model);
end

fitness = fitness./extPar.numTrials;

end