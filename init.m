function extPar = init()
%This function initializes all the constant parameters and structures that 
%the calcFitness funtion needs whenever it runs.  This is done only once at
%the beginning of the run, and the extPar structure is passed through to
%everything that needs it.

extPar.fieldError = 1e-8; % units of uT

extPar.posError = 0.01; % units of cm

extPar.offset = 0; % units of uT

extPar.R = 18; % units of cm

extPar.h1 = 5; % units of cm

extPar.h2 = 20.05; % units of cm

extPar.R2 = 41.5; % units of cm

extPar.H = 60; % units of cm

extPar.numAverages = 1;

extPar.cell.radius = 1; % cm

extPar.cell.height = 1; % cm

extPar.cell.numPosRadius = 12;

extPar.cell.numPosHeight = 12;

extPar.EDMcell.radius = 1; % cm

extPar.EDMcell.height = 1; % cm

extPar.EDMcell.numPosRadius = 100;

extPar.EDMcell.numPosHeight = 100;

extPar.numTrials = 25;
end