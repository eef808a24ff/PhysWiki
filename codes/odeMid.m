% ���ò���
N = 6;
h = 0.5;
t = linspace(0, (N-1)*h, N); % �Ա���
t0 = linspace(0, (N-1)*h, 100); % ���ڻ�ͼ

% ŷ����
y = zeros(1,N); % Ԥ��ֵ
y(1) = 1; % ��ֵ
for ii = 1:N-1
    y(ii+1) = y(ii) + h*y(ii);
end

% ��ͼ
figure;
plot(x,y,'+-');
hold on;
plot(t0, exp(t0));

%�е㷨
y = zeros(1,N);
y(1) = 1;
for ii = 1:N-1
    y(ii+1) = y(ii) + h*(y(ii) + 0.5*h*y(ii));
end

% ��ͼ
figure;
plot(x,y,'+-');
hold on;
plot(x0, exp(x0));
