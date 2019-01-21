function fitness = calcFitness(Xtemp,extPar,model)
%calcFitness takes in a position ad the simulated g values, and reports how
%well the program was able to extract the gradients with the fit function

fitness = 0;
pos = reshape(Xtemp,length(Xtemp)./3,3);
penalty = 0;
auxOutput(model).penalty = false;
for i = 1:length(pos(:,1))
    if isPenalty(pos(i,:),extPar) % checks if each position is penalizable
        penalty = penalty + calcPenalty(pos(i,:),extPar);
        auxOutput(model).penalty = true; % sets penalized flag to true if even one position is penalized
    end
end

transMatZ = calcTransMatZThird(pos);  %this matrix should be the truncated
%order with no errors

for i = 1:extPar.numAverages
    
    posErrors = calcPosErrors(pos,extPar.posError);
    
    g = genGradRandom();%generate random gradient on the order of the largest
    %expected from the measured uniformity of magnetically shielded rooms
    
    dReal = calcdFalseFifth(extPar.R,extPar.h1,extPar.h2,g); %dReal should
    %always be calculated to the highest order with no errors
    
    for j = length(posErrors):-1:1
        Bfield(j,1) = calcBavg(extPar,posErrors(j,:),g) + randn.*extPar.fieldError + extPar.offset;
    end
    
    g_fit = calcGrad(Bfield,transMatZ);%truncated order, NO ERRORS IN TRANSMAT
    
    dFit = calcdFalseThird(extPar.R,extPar.h1,extPar.h2,g_fit); %truncated order
    
    %fitness = 1e6*sqrt(sum((g(1:length(g_fit)) - g_fit).^2));
    
    fitness = fitness + penalty + 100*(abs(dReal - dFit))/abs(dReal);%goal is for this to be as
    %low as possible for any arbitrary g
end
fitness = fitness/extPar.numAverages;
end