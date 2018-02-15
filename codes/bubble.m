% ð�ݷ�����
function [x, order] = bubble(x, option)
N = numel(x); % ���и���
order = 1:N; % ����
changed = 1; % �Ƿ����û�
while(changed == 1)
    changed = 0;
    for ii = 1:N-1
        if x(ii) > x(ii + 1)
            % �û�
            changed = 1;
            temp = x(ii);
            x(ii) = x(ii + 1);
            x(ii + 1) = temp;
            temp = order(ii);
            order(ii) = order(ii + 1);
            order(ii + 1) = temp;
        end
    end
end
% �Ƿ��ǽ�������
if nargin > 1 && option(1) == 'd'
    x(:) = flipud(x(:));
    order = fliplr(order);
end
end
