clear;
clc;
[px,py] = meshgrid(-3:.2:12);
z=qx(px,py);
v=[25;20;15;10;5;0;-5;-10;-15];
x=[0 0;-0.4 0;10 0;11 0];
result=zeros(4,3);
fig1=figure(1);
set(fig1,'name','习题5-6','Numbertitle','off');
for i=1:4
    x_start=x(i,:)';
    str="("+x_start(1)+","+x_start(2)+")";
    subplot(2,2,i);
    [C h]=contour(px,py,z,v);
    clabel(C,h);
    hold on
    plot(x_start(1),x_start(2),'ro');
    hold off
    [result(i,1:2),result(i,3)]=SteepestDescent(x_start,'b.-');
    hold on
    plot(result(i,1),result(i,2),'gx');
    hold off
    legend("等高线","初始点",str+"迭代路径","终点",'location','NorthWest');
    title("初始点为："+str);
end
for i=1:4
    fprintf("第%d次迭代，初始点为(%f,%f),最优值为(%f,%f),收敛因子为%f\n",i,x(i,:),result(i,:));
end
max=max(result(:,3));
fprintf("所有迭代中最大的收敛因子是%f\n",max);


