% a visualization for spherical harmonics

close all;
N = 2000;
th = linspace(0, 2*pi, N);
ph = zeros(1, N);
i = 1;
figure;
for l = 0:3
    for m = -l:l
        Ylm = real(SphHarm(l, m, th, ph));
        mask_p = Ylm >= 0; mask_m = Ylm < 0;
        Ylm = abs(Ylm);
        clf; plot(Ylm(mask_p) .* sin(th(mask_p)), Ylm(mask_p) .* cos(th(mask_p)), 'Color', 'r', 'LineWidth', 3);
        hold on; plot(Ylm(mask_m) .* sin(th(mask_m)), Ylm(mask_m) .* cos(th(mask_m)), 'Color', 'b', 'LineWidth', 3);
        axis equal; axis([-0.8, 0.8, -1.4, 1.4]);
        title(['l = ' num2str(l) ', m = ' num2str(m)]);
        xlabel x; zlabel z;
        drawnow; pause(0.3);
        % saveas(gcf, ['SH_' num2str(i) '.png']); i = i + 1;
    end
end
