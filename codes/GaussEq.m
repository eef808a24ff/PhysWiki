function GaussEq(A,y)
%列主元高斯消元法解线性方程Ax=y
%默认x,y维度相同
disp('------------------------')
%分割线
A
y
n=length(y);%读取方程组维度
B=[A,y];%创建增广矩阵
for k=1:n-1%主循环
    [element,linenum_k]=max(abs(B(k:n,k)));
    %搜索列主元，使用max()函数返回最大元素和对应行号
    linenum=linenum_k +k-1;
    %将主元在B(k:n,k)中的行号转换为在B中的行号
    if linenum>k
    %列主元所在行不是当前行，将当前行与列主元所在行交换
        temp=B(k,:);
        B(k,:)=B(linenum,:);
        B(linenum,:)=temp;  
    end
    if element ~=0
       for i=k+1:n %消元 %子循环1
           m(i,k)=B(i,k)/B(k,k);%求消元系数
           B(i,k:n+1)=B(i,k:n+1)-m(i,k)*B(k,k:n+1);%对第i行消元 
       end
    else%当前列无主元
        for p=k+1:n+1%依次向后一列检索主元 %子循环2
            [element1,linenum1_k]=max(abs(B(k:n,p)));
            if element1 ~= 0
                linenum1=linenum1_k +k-1;
                 %将主元所在行转换行号
                 if linenum1>k
                 %列主元所在行不是当前行，将当前行与列主元所在行交换
                     temp1=B(k,:); 
                     B(k,:)=B(linenum1,:);
                     B(linenum1,:)=temp1;  
                 end
                 for i=k+1:n %消元 %子循环3
                     m(i,k)=B(i,p)/B(k,p);%求消元系数
                     B(i,k:n+1)=B(i,k:n+1)-m(i,k)*B(k,k:n+1);%对第i行消元 
                 end
                 p=n+1;%跳出子循环2
            end
        end
    end
end
disp('消元后得到的简化增广矩阵是')
B %输出简化的增广矩阵
disp('------------------------')
%分割线
%开始回代
y(n)=B(n,n+1)/B(n,n);
for i=n-1:-1:1
    y(i)=(B(i,n+1)-sum(B(i,i+1:n).*y(i+1:n)'))/B(i,i);
end
clear x;
x=y;
disp('Ax=y的解是')
x %输出解
%代码使用方法：
%在命令行窗口输入系数矩阵A和常数列y,
%再输入GaussEq(A,y)，回车，即可运行。
end
