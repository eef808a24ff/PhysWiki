% ��֤����ʽ����(��������)
u = -3.5; % ��
x = 0.6; % |x|<1 ʹ��������
N = 100; % �������
Coeff = 1; % x^ii ��ǰ���ϵ��
result = 1; % ��ͽ��
for ii = 1:N
    % �� x^(ii-1) ��ϵ������ x^ii ��ϵ��
    Coeff = Coeff*(u-ii+1) / ii; 
    % �� x^(ii-1) ���ۼӵ���ͽ����
    result = result + Coeff * x^ii; 
end
disp('��ͽ��Ϊ')
disp(result)
format short % �ָ�Ĭ����ʾ
disp('��ȷ���Ϊ')
format long % ��ʾȫ��С��λ
disp((1+x)^u)
