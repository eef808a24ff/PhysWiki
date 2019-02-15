function curveFit
close all;
% ������ɼ�г����
N = 20;
x0 = linspace(0, 2*pi, N);
y0 = 5*rand * sin(x0 + 2*pi * rand) + 10 * rand;
y0 = y0 + 2*rand(1,20); % ����������
scatter(x0, y0, '+'); % ����ɢ��
hold on;

% Nelder-Mead �󷽲���Сֵ��
f = @(x) norm( x(1)*sin(x0 + x(2)) + x(3) - y0 )^2;
c = NelderMead(f, [5, 1, 5], 1e-7);
% ����Ͻ��
x = linspace(0, 2*pi, 50);
y1 = c(1) * sin(x + c(2)) + c(3);
plot(x, y1);

% �����Է������󷽲���Сֵ��
c = sinfit(x0, y0);
% ����Ͻ��
y2 = c(1)*cos(x) + c(2)*sin(x) + c(3);
plot(x, y2, '.');
end

% ��ϼ�г����
% y = C(1)*cos(x) + C(2)*sin(x) + C(3)
function C = sinfit(x, y)
N = numel(x);
cosx = cos(x); sinx = sin(x);
sc = sum(sinx.*cosx);
s = sum(sinx); c = sum(cosx);
% ϵ������
M = [sum(cosx.^2), sc          , c;
               sc, sum(sinx.^2), s;
                c,            s, N];
b = [sum(y.*cosx); sum(y.*sinx); sum(y)];
C = M\b; % �����Է�����
end
