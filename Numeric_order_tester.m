clear
load('goodSolutions3.mat')
g = genGradRandom();
extPar = init();
numTrials = 1000;
fifthOnumPoints = 24;
fourthOnumPoints = 24;
thirdOnumPoints = 24;
secondOnumPoints = 24;
firstOnumPoints = 24;
pos = reshape(OptimalSolutions.X,24,3);
for i = numTrials:-1:1
    %pos = genPos();
    transMatZ = calcTransMatZFifth(pos);  %this matrix should be the truncated order
    posErrors = calcPosErrors(pos,extPar.posError);
    transMatErrors5(:,:,1) = calcTransMatXFifth(posErrors);  % These should be to the highest order
    transMatErrors5(:,:,2) = calcTransMatYFifth(posErrors);
    transMatErrors5(:,:,3) = calcTransMatZFifth(posErrors);
    Bfield = calcBfieldErrors(transMatErrors5,g,extPar.posError,extPar.offset);
    gFifth(:,i) = calcGrad(Bfield,transMatZ);%truncated order, NO ERRORS IN TRANSMAT
end
gFifth_avg = mean(gFifth,2);
gFifth_std = std(gFifth,0,2);
figure(1)
subplot(2,3,6);
plotG(gFifth_avg);
% problematic = checkProblematic(gFifth_avg);
% find(gFifth_avg(problematic==true))
hold on
e = errorbar(abs(gFifth_avg),gFifth_std,'.','MarkerSize',20,'LineWidth',2);
e.Color = 'black';
ylim manual
e.LData = e.YData - max(1e-22,e.YData-e.LData);
line([3.5,8.5],[1.5e-6,1.5e-6],'Color','r','LineWidth',2);
line([8.5,15.5],[6.3e-8,6.3e-8],'Color','r','LineWidth',2);
line([15.5,24.5],[4e-9,4e-9],'Color','r','LineWidth',2);
line([24.5,35.5],[6e-10,6e-10],'Color','r','LineWidth',2);
line([35.5,48.5],[3e-12,3e-12],'Color','r','LineWidth',2);
plot(abs(g(1:48)),'Co','MarkerSize',10,'LineWidth',1);
line([3.5,8.5],[3e-5,3e-5],'Color','g','LineWidth',2);
line([8.5,15.5],[6e-7,6e-7],'Color','g','LineWidth',2);
line([15.5,24.5],[6e-9,6e-9],'Color','g','LineWidth',2);
line([24.5,35.5],[9.5e-11,9.5e-11],'Color','g','LineWidth',2);
line([35.5,48.5],[9e-13,9e-13],'Color','g','LineWidth',2);
title('fifth order fit with '+string(fifthOnumPoints)+' positions');
for i = numTrials:-1:1
    %pos = genPos();
    
    transMatZ4 = calcTransMatZFourth(pos);  %this matrix should be the truncated order
    posErrors4 = calcPosErrors(pos,extPar.posError);
    transMatErrors4(:,:,1) = calcTransMatXFifth(posErrors4);  % These should be to the highest order
    transMatErrors4(:,:,2) = calcTransMatYFifth(posErrors4);
    transMatErrors4(:,:,3) = calcTransMatZFifth(posErrors4);
    Bfield4 = calcBfieldErrors(transMatErrors4,g,extPar.posError,extPar.offset);
    gFourth(:,i) = calcGrad(Bfield4,transMatZ4);%truncated order, NO ERRORS IN TRANSMAT
end
gFourth_avg = mean(gFourth,2);
gFourth_std = std(gFourth,0,2);
subplot(2,3,5);
plotG(gFourth_avg);
% problematic = checkProblematic(gFourth_avg);
% find(gFourth_avg(problematic==true))
hold on
e = errorbar(abs(gFourth_avg),gFourth_std,'.','MarkerSize',20,'LineWidth',2);
e.Color = 'black';
ylim manual
e.LData = e.YData - max(1e-22,e.YData-e.LData);
line([3.5,8.5],[1.5e-6,1.5e-6],'Color','r','LineWidth',2);
line([8.5,15.5],[6.3e-8,6.3e-8],'Color','r','LineWidth',2);
line([15.5,24.5],[4e-9,4e-9],'Color','r','LineWidth',2);
line([24.5,35.5],[6e-10,6e-10],'Color','r','LineWidth',2);
plot(abs(g(1:35)),'Co','MarkerSize',10,'LineWidth',1);
line([3.5,8.5],[3e-5,3e-5],'Color','g','LineWidth',2);
line([8.5,15.5],[6e-7,6e-7],'Color','g','LineWidth',2);
line([15.5,24.5],[6e-9,6e-9],'Color','g','LineWidth',2);
line([24.5,35.5],[9.5e-11,9.5e-11],'Color','g','LineWidth',2);
title('fourth order fit with '+string(fourthOnumPoints)+' positions');
for i = numTrials:-1:1
    %pos = genPos();
    
    transMatZ3 = calcTransMatZThird(pos);  %this matrix should be the truncated order
    posErrors3 = calcPosErrors(pos,extPar.posError);
    transMatErrors3(:,:,1) = calcTransMatXFifth(posErrors3);  % These should be to the highest order
    transMatErrors3(:,:,2) = calcTransMatYFifth(posErrors3);
    transMatErrors3(:,:,3) = calcTransMatZFifth(posErrors3);
    Bfield3 = calcBfieldErrors(transMatErrors3,g,extPar.posError,extPar.offset);
    gThird(:,i) = calcGrad(Bfield3,transMatZ3);%truncated order, NO ERRORS IN TRANSMAT
end
gThird_avg = mean(gThird,2);
gThird_std = std(gThird,0,2);
subplot(2,3,4);
plotG(gThird_avg);
% problematic = checkProblematic(gThird_avg);
% find(gThird_avg(problematic==true))
hold on
e = errorbar(abs(gThird_avg),gThird_std,'.','MarkerSize',20,'LineWidth',2);
e.Color = 'black';
ylim manual
e.LData = e.YData - max(1e-22,e.YData-e.LData);
plot(abs(g(1:24)),'Co','MarkerSize',10,'LineWidth',1);
line([3.5,8.5],[1.5e-6,1.5e-6],'Color','r','LineWidth',2);
line([8.5,15.5],[6.3e-8,6.3e-8],'Color','r','LineWidth',2);
line([15.5,24.5],[4e-9,4e-9],'Color','r','LineWidth',2);

line([3.5,8.5],[3e-5,3e-5],'Color','g','LineWidth',2);
line([8.5,15.5],[6e-7,6e-7],'Color','g','LineWidth',2);
line([15.5,24.5],[6e-9,6e-9],'Color','g','LineWidth',2);
title('third order fit with '+string(thirdOnumPoints)+' positions');
for i = numTrials:-1:1  
    %pos = genPos();
    
    transMatZ2 = calcTransMatZSecond(pos);  %this matrix should be the truncated order
    posErrors2 = calcPosErrors(pos,extPar.posError);
    transMatErrors2(:,:,1) = calcTransMatXFifth(posErrors2);  % These should be to the highest order
    transMatErrors2(:,:,2) = calcTransMatYFifth(posErrors2);
    transMatErrors2(:,:,3) = calcTransMatZFifth(posErrors2);
    Bfield2 = calcBfieldErrors(transMatErrors2,g,extPar.posError,extPar.offset);
    gSecond(:,i) = calcGrad(Bfield2,transMatZ2);%truncated order, NO ERRORS IN TRANSMAT
end
gSecond_avg = mean(gSecond,2);
gSecond_std = std(gSecond,0,2);
subplot(2,3,3);
plotG(gSecond_avg);
% problematic = checkProblematic(gSecond_avg);
% find(gSecond_avg(problematic==true))
hold on
e = errorbar(abs(gSecond_avg),gSecond_std,'.','MarkerSize',20,'LineWidth',2);
e.Color = 'black';
ylim manual
e.LData = e.YData - max(1e-22,e.YData-e.LData);
plot(abs(g(1:15)),'Co','MarkerSize',10,'LineWidth',1);
line([3.5,8.5],[1.5e-6,1.5e-6],'Color','r','LineWidth',2);
line([8.5,15.5],[6.3e-8,6.3e-8],'Color','r','LineWidth',2);

line([3.5,8.5],[3e-5,3e-5],'Color','g','LineWidth',2);
line([8.5,15.5],[6e-7,6e-7],'Color','g','LineWidth',2);
title('second order fit with '+string(secondOnumPoints)+' positions');
for i = numTrials:-1:1
    %pos = genPos();
    
    transMatZ1 = calcTransMatZFirst(pos);  %this matrix should be the truncated order
    posErrors1 = calcPosErrors(pos,extPar.posError);
    transMatErrors1(:,:,1) = calcTransMatXFifth(posErrors1);  % These should be to the highest order
    transMatErrors1(:,:,2) = calcTransMatYFifth(posErrors1);
    transMatErrors1(:,:,3) = calcTransMatZFifth(posErrors1);
    Bfield1 = calcBfieldErrors(transMatErrors1,g,extPar.posError,extPar.offset);
    gFirst(:,i) = calcGrad(Bfield1,transMatZ1);%truncated order, NO ERRORS IN TRANSMAT
end
gFirst_avg = mean(gFirst,2);
gFirst_std = std(gFirst,0,2);
subplot(2,3,2);
plotG(gFirst_avg);
% problematic = checkProblematic(gFirst_avg);
% find(gFirst_avg(problematic==true))
hold on
e = errorbar(abs(gFirst_avg),gFirst_std,'.','MarkerSize',20,'LineWidth',2);
e.Color = 'black';
ylim manual
e.LData = e.YData - max(1e-22,e.YData-e.LData);
plot(abs(g(1:8)),'Co','MarkerSize',10,'LineWidth',1);
line([3.5,8.5],[1.5e-6,1.5e-6],'Color','r','LineWidth',2);
line([3.5,8.5],[3e-5,3e-5],'Color','g','LineWidth',2);
title('first order fit with '+string(firstOnumPoints)+' positions');
subplot(2,3,1);
plotG(g)
plot(abs(g),'Co');
line([3.5,8.5],[1.5e-6,1.5e-6],'Color','r','LineWidth',2);
line([8.5,15.5],[6.3e-8,6.3e-8],'Color','r','LineWidth',2);
line([15.5,24.5],[4e-9,4e-9],'Color','r','LineWidth',2);
line([24.5,35.5],[6e-10,6e-10],'Color','r','LineWidth',2);
line([35.5,48.5],[3e-12,3e-12],'Color','r','LineWidth',2);
line([3.5,8.5],[3e-5,3e-5],'Color','g','LineWidth',2);
line([8.5,15.5],[6e-7,6e-7],'Color','g','LineWidth',2);
line([15.5,24.5],[6e-9,6e-9],'Color','g','LineWidth',2);
line([24.5,35.5],[9.5e-11,9.5e-11],'Color','g','LineWidth',2);
line([35.5,48.5],[9e-13,9e-13],'Color','g','LineWidth',2);
title('exact g');