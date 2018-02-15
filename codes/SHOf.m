% �����趨
m = 0.1; % ����
k = 1; % ����ϵ��
a = 0.03; % ����ϵ��
T = 20; % ֹͣʱ��
Nstep = 10000; % ����
A = 2; w = 3; % f(t)=A*sin(w*t);

dt = T/Nstep; % ���㲽��
y2 = zeros(step,1); y1 = y2; y = y2; % ����Ԥ��ֵ
y(1) = 0; y1(1) = 0; % ��ֵ, y1 �� y ��һ�׵���

% ����ѭ��
for ii = 2:step
    y2(ii) = (-a*y1(ii)-k*y(ii)+2*sin(w*(ii*dt)))/m; % ����΢�ַ������ y''.
    y(ii) = y(ii-1) + y1(ii-1)*dt; % y ��΢�ֽ���
    y1(ii) = y1(ii-1) + y2(ii-1)*dt; % y' ��΢�ֽ���
end

% ��ͼ
t=(0:step-1)*dt;
plot(t,y);
