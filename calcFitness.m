function fitness = calcFitness(Xtemp,extPar)
%calcFitness takes in a position ad the simulated g values, and reports how
%well the program was able to extract the gradients with the fit function

pos = reshape(Xtemp,24,3);

transMatZ = calcTransMatZFifth(pos);  %this matrix should be the truncated
%order with no errors

posErrors = calcPosErrors(pos,extPar.posError);

transMatErrors(:,:,1) = calcTransMatXFifth(posErrors); % These should be 
transMatErrors(:,:,2) = calcTransMatYFifth(posErrors); % to the highest 
transMatErrors(:,:,3) = calcTransMatZFifth(posErrors); % order, with errors

g = genGradRandom();%generate random gradient on the order of the largest 
%expected from the measured uniformity of magnetically shielded rooms

dReal = calcdFalseFifth(extPar.R,extPar.h1,extPar.h2,g); %dReal should 
%always be calculated to the highest order with no errors

Bfield = calcBfieldErrors(transMatErrors,g,extPar.fieldError,extPar.offset);%...
%highest order, plus errors

g_fit = calcGrad(Bfield,transMatZ);%truncated order, NO ERRORS IN TRANSMAT
 
dFit = calcdFalseFifth(extPar.R,extPar.h1,extPar.h2,g_fit); %truncated order

%fitness = 1e6*sqrt(sum((g(1:length(g_fit)) - g_fit).^2));

fitness = 100*(abs(dReal - dFit))/abs(dReal);%goal is for this to be as 
%low as possible for any arbitrary g

end