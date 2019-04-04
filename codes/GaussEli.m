% ��˹��Ԫ���õ�����ϵ������
% ��ʾÿ���б任�Ĳ����ͽ��
% A Ϊ����ߴ�ľ���
% ��� A ��������� ���� augmented = true�� ��� A ��ϵ������ augmented = false
% ����� A �����ξ��� q ��һ����ʸ���� q(ii) �ǵ� ii �е�һ����Ϊ����б�
% ����� ii ��ȫΪ�㣬 �� q(ii) = 0

function [A, q] = GaussEli(A, augmented)
% ϵ����������� Nr ������ Nc
[Nr, Nc] = size(A);
if (augmented)
	Nc = Nc - 1;
end
q = zeros(1,Nr); q(1) = 1;
disp(A);
for ii = 1:Nr-1
	% ����� ii ��
	if (ii > 1)
		q(ii) = q(ii - 1) + 1;
	end
	for jj = q(ii) : Nc
		% ���� jj ��
		if (max(abs(A(ii:end, q(ii)))) > 0)
			% ��Ԫʹ A(ii+1:end, q(ii)) ȫΪ 0
            A = eli1(A, ii, q(ii));
            break;
		else
			% ����Ҫ��Ԫ�������һ��
            if (q(ii) < Nc)
                q(ii) = q(ii) + 1;
            else
                return;
            end
        end
    end
end
end

% ���б任ʹ A(ii+1:end, q) ȫΪ 0
% A(ii:end,q) ����ȫΪ 0
function A = eli1(A, ii, q)
% �������У�ʹ A(ii,q) �� A(ii:end, q) �����
[~, iimax] = max(abs(A(ii:end, q)));
iimax = ii + iimax - 1;
if (iimax > ii)
    disp(['����: r_', num2str(ii), ' <-> r_', num2str(iimax)]);
    temp = A(ii,:);
    A(ii,:) = A(iimax,:);
    A(iimax,:) = temp;
    disp(A);
end

% �õ� ii ����ȥ���� A(ii+1:end, q)
for jj = ii+1 : size(A,1)
    if (A(jj,q) == 0)
        continue;
    end
    k = -A(jj,q)/A(ii,q);
    disp(['��Ԫ: ', num2str(k), ' * r_', num2str(ii), ' + r_', num2str(jj)]);
    A(jj,:) = A(ii,:) * k + A(jj,:);
    disp(A);
end
end