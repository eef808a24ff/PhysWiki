% ��֤����ʽ����(��������)
u = -3.5;
x = 0.6; % |x|<1 ʹ��������
N = 100; % �������
Coeff = 1; % x^ii ��ǰ���ϵ��
result = 1; % ��ͽ��
for ii = 1:N
    Coeff = Coeff*(u-ii+1) / ii;
    result = result + Coeff * x^(ii);
end
disp('ֱ�Ӽ�����Ϊ')
format long % ��ʾȫ��С��λ
disp((1+x)^u)
disp('��ͽ��Ϊ')
disp(result)
format short % �ָ�Ĭ����ʾ
% test keyword color
tan; cot; asin; acos; atan; arg; real; imag; sum; mean; diff; floor; ceil; mod; sinh; cosh; round; tanh; zeros; ones; rand; randn; eye; magic;
