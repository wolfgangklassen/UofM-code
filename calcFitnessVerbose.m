function fitness = calcFitnessVerbose(Xtemp,extPar)
%calcFitness takes in a position ad the simulated g values, and reports how
%well the program was able to extract the gradients with the fit function.
%This function uses a fitness object in order to extract more information
%than just the fitness.

pos = reshape(Xtemp,24,3);

transMatZ = calcTransMatZThird(pos);  %this matrix should be the truncated
%order with no errors

posErrors = calcPosErrors(pos,extPar.posError);

transMatErrors(:,:,1) = calcTransMatXFifth(posErrors); % These should be 
transMatErrors(:,:,2) = calcTransMatYFifth(posErrors); % to the highest 
transMatErrors(:,:,3) = calcTransMatZFifth(posErrors); % order, with errors

fitness.g = genGradRandom();%generate random gradient on the order of the largest 
%expected from the measured uniformity of magnetically shielded rooms

fitness.dReal = calcdFalseFifth(extPar.R,extPar.h1,extPar.h2,fitness.g); %dReal should 
%always be calculated to the highest order with no errors

Bfield = calcBfieldErrors(transMatErrors,fitness.g,extPar.fieldError,extPar.offset);%...
%highest order, plus errors

fitness.g_fit = calcGrad(Bfield,transMatZ);%truncated order, NO ERRORS IN TRANSMAT
 
fitness.dFit = calcdFalseFourth(extPar.R,extPar.h1,extPar.h2,fitness.g_fit); %truncated order

fitness.percentError = 100*(abs(fitness.dReal - fitness.dFit))/abs(fitness.dReal);
%fitness.percentError = 1e6*sqrt(sum((fitness.g(1:length(fitness.g_fit)) - fitness.g_fit).^2));
%fitness = 100*(abs(dReal - dFit))/abs(dReal);%goal is for this to be as 
%low as possible for any arbitrary g

end