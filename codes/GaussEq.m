function GaussEq(A,y)
%����Ԫ��˹��Ԫ�������Է���Ax=y
%Ĭ��x,yά����ͬ
disp('------------------------')
%�ָ���
A
y
n=length(y);%��ȡ������ά��
B=[A,y];%�����������
for k=1:n-1%��ѭ��
    [element,linenum_k]=max(abs(B(k:n,k)));
    %��������Ԫ��ʹ��max()�����������Ԫ�غͶ�Ӧ�к�
    linenum=linenum_k +k-1;
    %����Ԫ��B(k:n,k)�е��к�ת��Ϊ��B�е��к�
    if linenum>k
    %����Ԫ�����в��ǵ�ǰ�У�����ǰ��������Ԫ�����н���
        temp=B(k,:);
        B(k,:)=B(linenum,:);
        B(linenum,:)=temp;  
    end
    if element ~=0
       for i=k+1:n %��Ԫ %��ѭ��1
           m(i,k)=B(i,k)/B(k,k);%����Ԫϵ��
           B(i,k:n+1)=B(i,k:n+1)-m(i,k)*B(k,k:n+1);%�Ե�i����Ԫ 
       end
    else%��ǰ������Ԫ
        for p=k+1:n+1%�������һ�м�����Ԫ %��ѭ��2
            [element1,linenum1_k]=max(abs(B(k:n,p)));
            if element1 ~= 0
                linenum1=linenum1_k +k-1;
                 %����Ԫ������ת���к�
                 if linenum1>k
                 %����Ԫ�����в��ǵ�ǰ�У�����ǰ��������Ԫ�����н���
                     temp1=B(k,:); 
                     B(k,:)=B(linenum1,:);
                     B(linenum1,:)=temp1;  
                 end
                 for i=k+1:n %��Ԫ %��ѭ��3
                     m(i,k)=B(i,p)/B(k,p);%����Ԫϵ��
                     B(i,k:n+1)=B(i,k:n+1)-m(i,k)*B(k,k:n+1);%�Ե�i����Ԫ 
                 end
                 p=n+1;%������ѭ��2
            end
        end
    end
end
disp('��Ԫ��õ��ļ����������')
B %����򻯵��������
disp('------------------------')
%�ָ���
%��ʼ�ش�
y(n)=B(n,n+1)/B(n,n);
for i=n-1:-1:1
    y(i)=(B(i,n+1)-sum(B(i,i+1:n).*y(i+1:n)'))/B(i,i);
end
clear x;
x=y;
disp('Ax=y�Ľ���')
x %�����
%����ʹ�÷�����
%�������д�������ϵ������A�ͳ�����y,
%������GaussEq(A,y)���س����������С�
end
