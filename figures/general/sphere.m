% plot sphere for PhysWiki

Ntheta = 9;
theta = linspace(0, pi, Ntheta + 2); theta = theta(2:end-1);
Nth = 200;
th = linspace(0, 2*pi, Nth);
ViewAngle = pi/6;

X = zeros(Ntheta, Nth); Y = X; Z = X;
for ii = 1:numel(theta)
    X(ii, :) = sin(theta(ii))*cos(th);
    Y(ii, :) = sin(theta(ii))*sin(th);
    Z(ii, :) = cos(theta(ii));
end

figure; hold on; axis equal;
for ii = 1:Ntheta
    plot3(X(ii,:), Y(ii,:), Z(ii,:), 'k');
end

view(30,30);
