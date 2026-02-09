
box = Container(200,100);
s1 = Source(box, 8, [-6;0], 0);
s2 = Source(box, 8, [6;0], 0);

[X,Y,Z1] = s1.D(0);
[~,~,Z2] = s2.D(0);

figure; hold on;
xlim([-100 100]); ylim([-50 50]); axis equal;

style = [[1;(linspace(0,1,50))';(linspace(1,1,50))';0.5] [0;(linspace(0.7,1,50))';(linspace(1,1,50))';0] [0;(linspace(1,1,50))';(linspace(1,0,50))';1]];

% h = pcolor(X,Y,Z1+Z2, 'FaceColor','interp', 'LineStyle','none'); colormap(style);
h = imagesc([-100 100],[-50 50],Z1+Z2); colormap(style);
for t = 0:.1:10
    [~,~,Z1] = s1.D(t);
    [~,~,Z2] = s2.D(t);
    % h.ZData = Z1+Z2;
    h.CData = Z1+Z2;
    drawnow
end