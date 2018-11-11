% plot

x = linspace(0,2,300);
p = [1, 5/2, 25/2];
p = [p, 1./p];
p = [p, -p];
figure; hold on;
for ii = 1:numel(p)
    plot(x, x.^p(ii));
end
axis equal; axis([0,2,0,2]);

%% surf z^i

x = linspace(-10, 10, 300);
y = linspace(-10, 10, 300);
[X, Y] = ndgrid(x, y); Z = X + 1i*Y;
F = Z.^1i;

figure; surfCart(X,Y,abs(F)); view([0,90]);
figure; surfCart(X,Y,angle(F)); view([0,90]);
