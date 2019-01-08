function plotGoodPos(goodPos)


pos = reshape(goodPos,24,3);
%plots the positions of the magnetometers inside a cube
%generates a cube to define the outer edges of the figure
plotcube([100 100 100],[-50 -50 -50],0);
hold on
%generate a cylinder the size of the vacuum chamber
r = 41.4988; n = 20;
H = 66.30;
R1 = 18; R2 = 41.5;
[X,Y,Z] = cylinder(r,n);
Z(1,:) = -H/2;
Z(2,:) = H/2;
surf(X,Y,Z,'FaceAlpha',0);

%generate 2 cylinders to represent the regions of interest
r = 18; n = 40;
[X,Y,Z] = cylinder(r,n);
Z(1,:) = 5;
Z(2,:) = 20.5;
surf(X,Y,Z,'FaceAlpha',0.1);

r = 18; n = 40;
[X,Y,Z] = cylinder(r,n);
Z(1,:) = -20.5;
Z(2,:) = -5;
surf(X,Y,Z,'FaceAlpha',0.1);

scatter3(pos(:,1),pos(:,2),pos(:,3),5,'black','s','filled')

hold off

% rhoTemp = sqrt(goodPos(:,1,:).^2 + goodPos(:,2,:).^2);
% rho = reshape(rhoTemp,length(rhoTemp)*16,1);
% z = reshape(goodPos(:,3,:),length(rhoTemp)*16,1);
% Xedges = [-Inf R1:(R2-R1)/25:R2 Inf];
% Yedges = [-Inf -(H)/2:(H)/40:(H)/2 Inf];
%
% figure(2)
% %histogram2(rho,z,Xedges,Yedges,'displaystyle','tile')%,'normalization','countdensity')
% [density,~,~] = histcounts2(rho,z,Xedges,Yedges);
% dim = size(density);
% density = density';
% density(density==0) = [];
% density = reshape(density,dim(2)-2,dim(1)-2);
% density = interp2(density);
% surf(density);

camzoom(1);

end