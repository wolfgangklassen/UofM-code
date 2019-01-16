function plotG(g)
%plotG shows a visualization of the gradient vector.  Red bars are
%originally negative values.  The background of the chart show the order of
%m, with black bars being m = 0, and white bars |m| = ell+1
[posInd,~] = find(g>=0);
[negInd,~] = find(g<=0);

C = ones(length(g),1);
b = bar(C,'FaceAlpha',0.75);
b.FaceColor = 'flat';
zerothOrder = linspace(1,0,2);
firstOrder = linspace(1,0,3);
secondOrder = linspace(1,0,4);
thirdOrder = linspace(1,0,5);
fourthOrder = linspace(1,0,6);
fifthOrder = linspace(1,0,7);
color = [zerothOrder,fliplr(zerothOrder(1:end-1)),...
    firstOrder,fliplr(firstOrder(1:end-1)),...
    secondOrder,fliplr(secondOrder(1:end-1)),...
    thirdOrder,fliplr(thirdOrder(1:end-1)),...
    fourthOrder,fliplr(fourthOrder(1:end-1)),...
    fifthOrder,fliplr(fifthOrder(1:end-1))];
b.CData(:,:) = repmat(color(1:length(g)),3,1)';
hold on;
bar(posInd,g(posInd),'b');
bar(negInd,abs(g(negInd)),'r');
set(gca,'yscale','log')
ylim([1e-22 10])
end