close all;
x = linspace(-3, 3, 300);
figure;
plot(x, real((1+x).^(1./x)));
hold on;
scatter(0, exp(1));
axis([-3, 3, -8, 8]);