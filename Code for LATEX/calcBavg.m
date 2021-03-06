function Bavg = calcBavg(extPar,pos,g)
%calcBavg returns the average Bfield over the input points "pos" for a
%given magnetic field described by "g"

posCell = genPosCell(extPar.cell,pos);

transMat(:,:,1) = calcTransMatXFifth(posCell); % These should be
transMat(:,:,2) = calcTransMatYFifth(posCell); % to the highest
transMat(:,:,3) = calcTransMatZFifth(posCell); % order, with errors

Bfield = calcBfield(transMat,g);

Bavg = mean(Bfield);

end