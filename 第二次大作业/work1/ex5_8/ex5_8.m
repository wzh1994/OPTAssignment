clear;clc;
x1=1:1:100;
x2=1:1:100;
[px,py]=meshgrid(x1,x2);
idl = px + py >= 100;
px(idl)=nan;
py(idl)=nan;
idl = px - py >= 50;
px(idl)=nan;
py(idl)=nan;
x=[8,90;1,40;15,68.69;10,20];
%u=1
mu=1;
fig1=figure(1);
set(fig1,'name','u=1，无线搜索','Numbertitle','off');
fprintf("u=1，无线搜索时牛顿法运行结果：\n");
for i=1:4
    fprintf("初始点为("+x(i,1)+","+x(i,2)+")的迭代:  ");
    subplot(2,2,i);
    pz=qx(px,py,mu);
    contour(px,py,pz,20);
    x1=(50:1:75)';
    x2=(75:-1:0)';
    y1=x1-50;
    y2=100-x2;
    hold on
    plot([x1;x2],[y1;y2],'r-');
    plot(x(i,1),x(i,2),'go');
    hold off
    BasicNewton(x(i,:)',mu);
    legend("等高线","定义域","初始点","迭代路径");
    title("初始点为("+x(i,1)+","+x(i,2)+")的迭代");
end
fprintf("程序暂停，输入回车以继续... 输入之后将清空命令行和图示\n");;
pause;
clc;close all;
fig2=figure(2);
set(fig2,'name','u=1，有线搜索','Numbertitle','off');
fprintf("u=1，有线搜索时牛顿法运行结果：\n");
x=[8,90;1,40;15,68.69;10,20];
for i=1:4
    subplot(2,2,i);
    pz=qx(px,py,mu);
    contour(px,py,pz,20);
    x1=(50:1:75)';
    x2=(75:-1:0)';
    y1=x1-50;
    y2=100-x2;
    hold on
    plot([x1;x2],[y1;y2],'r-');
    plot(x(i,1),x(i,2),'go');
    hold off
    [r,k]=LinearNewton(x(i,:)',mu);
    fprintf("第%d个点，初始点为("+x(i,1)+","+x(i,2)+")经过%d次迭代终止在("+r(1)+","+r(2)+")\n",i,k);
    legend("等高线","定义域","初始点","迭代路径");
    title("初始点为("+x(i,1)+","+x(i,2)+")的迭代");
end

%u=0.1
mu=0.1;
fprintf("程序暂停，输入回车以继续... 输入之后将清空命令行和图示\n");;
pause;
clc;close all;
fig3=figure(3);
set(fig3,'name','u=0.1，无线搜索','Numbertitle','off');
fprintf("u=1，无线搜索时牛顿法运行结果：\n");
x=[8,90;1,40;15,68.69;10,20];
for i=1:4
    fprintf("初始点为("+x(i,1)+","+x(i,2)+")的迭代:  ");
    subplot(2,2,i);
    pz=qx(px,py,mu);
    contour(px,py,pz,20);
    x1=(50:1:75)';
    x2=(75:-1:0)';
    y1=x1-50;
    y2=100-x2;
    hold on
    plot([x1;x2],[y1;y2],'r-');
    plot(x(i,1),x(i,2),'go');
    hold off
    BasicNewton(x(i,:)',mu);
    legend("等高线","定义域","初始点","迭代路径");
    title("初始点为("+x(i,1)+","+x(i,2)+")的迭代");
end

fprintf("程序暂停，输入回车以继续... 输入之后将清空命令行和图示\n");;
pause;
clc;close all;
fig4=figure(4);
set(fig4,'name','u=0.1，有线搜索','Numbertitle','off');
fprintf("u=1，有线搜索时牛顿法运行结果：\n");
x=[8,90;1,40;15,68.69;10,20];
for i=1:4
    subplot(2,2,i);
    pz=qx(px,py,mu);
    contour(px,py,pz,20);
    x1=(50:1:75)';
    x2=(75:-1:0)';
    y1=x1-50;
    y2=100-x2;
    hold on
    plot([x1;x2],[y1;y2],'r-');
    plot(x(i,1),x(i,2),'go');
    hold off
    [r,k]=LinearNewton(x(i,:)',mu);
    fprintf("第%d个点，初始点为("+x(i,1)+","+x(i,2)+")经过%d次迭代终止在("+r(1)+","+r(2)+")\n",i,k);
    legend("等高线","定义域","初始点","迭代路径");
    title("初始点为("+x(i,1)+","+x(i,2)+")的迭代");
end

