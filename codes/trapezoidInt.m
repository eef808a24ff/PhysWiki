% ���η���ֵ����
% f �Ǳ��������ĺ������
% [a, b] Ϊ��������
% N Ϊ���������
function I = trapezoidInt(f, a, b, N)
x = linspace(a, b, N+1);
y = arrayfun(f, x); % ������ y(i) = f(x(i))
h = (b - a)/N;
I = h*(0.5*y(1) + 0.5*y(N+1) + sum(y(2:N)));
end

