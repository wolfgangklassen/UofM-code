function extPar = init()
%This function initializes all the constant parameters and structures that 
%the calcFitness funtion needs whenever it runs.  This is done only once at
%the beginning of the run, and the extPar structure is passed through to
%everything that needs it.

extPar.fieldError = 1e-8; %units of uT

extPar.posError = 0.01; %units of cm

extPar.offset = 0;

extPar.R = 18; % units of cm

extPar.h1 = 5;

extPar.h2 = 20.05;

end