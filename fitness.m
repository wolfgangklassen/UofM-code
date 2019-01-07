function F = fitness(X,extPar)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%This function takes requests from Ferret in the form of columns of
%parameters to test.  This returns a column of fitness results, in this
%case chi squared values.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

[numPar, N] = size(X);
%numPar->number of parameters to fit in the model
%N->number of models requested by Ferret
for model = N:-1:1
    %select a single column of parameters to check
    Xtemp = X(:,model);
    %check parameters
    F(model) = calcFitness(Xtemp,extPar);
end

end