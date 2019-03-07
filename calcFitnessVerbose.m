function fitness = calcFitnessVerbose(Xtemp,extPar)
%calcFitness takes in a position ad the simulated g values, and reports how
%well the program was able to extract the gradients with the fit function.
%This function uses a fitness object in order to extract more information
%than just the fitness.
for n = extPar.numAverages:-1:1
    
    pos = reshape(Xtemp,length(Xtemp)./3,3);
    posErrors = calcPosErrors(pos,extPar.posError);
    fitness.g = genGradRandom();%generate random gradient on the order of the largest
    %expected from the measured uniformity of magnetically shielded rooms
    
    fitness.dReal = calcdFalseFifth(extPar.R,extPar.h1,extPar.h2,fitness.g); %dReal should
    %always be calculated to the highest order with no errors
    for i = length(pos):-1:1
        
        posTemp = pos;
        posErrorsTemp = posErrors;
        
        posTemp(i,:) = [];
        posErrorsTemp(i,:) = [];
        
        transMatZ = calcTransMatZThird(posTemp);  %this matrix should be the truncated
        %order with no errors
        
        for j = length(posErrorsTemp):-1:1
            Bfield(j,1) = calcBavg(extPar,posErrorsTemp(j,:),fitness.g) + randn.*extPar.fieldError + extPar.offset;
        end
        
        fitness.g_fit(:,i) = calcGrad(Bfield,transMatZ);%truncated order, NO ERRORS IN TRANSMAT
        
    end
    
    fitness.g_fit = mean(fitness.g_fit,2);
    
    fitness.dFit = calcdFalseThird(extPar.R,extPar.h1,extPar.h2,fitness.g_fit); %truncated order
    
    fitness.absError(n) = abs(fitness.dReal - fitness.dFit);
    %fitness.percentError = 1e6*sqrt(sum((fitness.g(1:length(fitness.g_fit)) - fitness.g_fit).^2));
    %fitness = 100*(abs(dReal - dFit))/abs(dReal);%goal is for this to be as
    %low as possible for any arbitrary g
end

fitness.absError = mean(fitness.absError);

end