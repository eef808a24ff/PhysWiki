function keplerRK4
% �����趨
GM = 1; % ����������������������������
x0 = 1; y0 = 0; % ��ʼλ��
vx0 = 0; vy0 = 0.7; % ��ʼ�ٶ�
tspan = [0; 4]; % ��ʱ��Ͳ���
Nt = 100; % ����

Y0 = [x0; y0; vx0; vy0]; % �������ֵ
f = @(Y, t)fun(Y, t, GM);
[Y,~] = odeRK4(f, tspan, Y0, Nt);

% ��ͼ
figure; hold on;
plot(Y(1,:), Y(2,:));
scatter(0, 0);
axis equal;
end

function Y1 = fun(Y, ~, GM)
% �����
x = Y(1); y = Y(2);
vx = Y(3); vy = Y(4);
Y1 = zeros(4,1); % Ԥ��ֵ
Y1(1) = vx;
Y1(2) = vy;
temp = -GM /(x^2 + y^2)^(3/2);
Y1(3) = temp * x;
Y1(4) = temp * y;
end
