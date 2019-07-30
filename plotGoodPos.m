function plotGoodPos(goodPos)



numFrames = 90;
for frameNumber = 1:numFrames
    
    pos = reshape(goodPos,length(goodPos)./3,3);
    %plots the positions of the magnetometers inside a cube
    %generates a cube to define the outer edges of the figure
    fig = figure;

    plotcube([100 100 100],[-50 -50 -50],0);
    hold on;
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
    filename = 'goodSolutions27.gif';
    scatter3(pos(:,1),pos(:,2),pos(:,3),15,'black','s','filled')
    camzoom(1);
    view([frameNumber*4 (15+10*sin(4*pi*(frameNumber/numFrames)))]);
    drawnow
    frame = getframe(fig);
    im{frameNumber} = frame2im(frame);
    [A,map] = rgb2ind(im{frameNumber},256);
    if frameNumber == 1
        imwrite(A,map,filename,'gif','LoopCount',Inf,'DelayTime',0.1);
    else
        imwrite(A,map,filename,'gif','Writemode','append','DelayTime',0.1);
    end
    close;
end

end