clear;clc;
px = (7.01:0.01:8.4)';
py=qx(px);

x=[7.40 7.20 7.01 7.80 7.88];
for i=1:5
    subplot(2,3,i);
    plot(px,py);
    xlabel('x');
    ylabel('f(x)');
    iter=LocalNewton(x(i));
    title("��ʼ��x="+x(i)+"����ε�������");
    fprintf("��%d�ε���������·��Ϊ(%f,%f)->(%f,%f)->\n(%f,%f)->(%f,%f)->(%f,%f)->(%f,%f)\n",i,iter(1,:),iter(2,:),iter(3,:),iter(4,:),iter(5,:),iter(6,:));
end

fprintf("\n������ĳ�ʼ��ĵ���:")
subplot(2,3,6);
plot(px,py);
xlabel('x');
ylabel('f(x)');
LocalNewton(7.8889);