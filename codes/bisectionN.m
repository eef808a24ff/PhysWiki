function roots = bisectionN(f, int, N)
x = linspace(int(1), int(2), N); % ��������
y = arrayfun(f, x); % ������ f(x(ii))
figure; plot(x, y, '.-') % ��ͼ
title('f(x)')
Sign = sign(y);
ind = find(Sign(1:end-1) .* Sign(2:end) <= 0); % �ҷ����������������
Nroot = numel(ind);
roots = zeros(1, Nroot); % Ԥ��ֵ
for ii = 1:Nroot
    roots(ii) = fzero(f, [x(ind(ii)),x(ind(ii)+1)]);  
end
end
