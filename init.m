function extPar = init()
%This function initializes all the constant parameters and structures that 
%the calcFitness funtion needs whenever it runs.  This is done only once at
%the beginning of the run, and the extPar structure is passed through to
%everything that needs it.

extPar.fieldError = 1e-8; % units of uT

extPar.posError = 0.01; % units of cm

extPar.offset = 0; % units of cm

extPar.R = 18; % units of cm

extPar.h1 = 5; % units of cm

extPar.h2 = 20.05; % units of cm

extPar.R2 = 41.5; % units of cm

extPar.H = 60; % units of cm

extPar.numAverages = 100;

end