clear;clc;
t=[2000;5000;10000;20000;30000;50000];
d=[0.9427;0.8616;0.7384;0.5362;0.3739;0.3096];
c=96.05;
x=-0.015:0.0002:0.01;
y=250:1:600;
[px py]=meshgrid(x,y);
nx=px./py;
ny=1./(px.*c)-1;
z=fx([nx;ny],t,d);
z(50000*px>=py)=nan;
z(px==0)=nan;
v=[0.3;0.2;0.1;0.05;0.025;0.01;0.005;0.0044];
[cs,h]=contour(x,y,z,v);
clabel(cs,h);
x=0:0.0002:0.015;
y=50000*x;
y(y>500|y<250)=nan;
hold on
plot(x,y,'r-');
hold off

%第一个迭代点
x=[0.00333;333];
hold on
plot(x(1),x(2),'ro');
hold off
nx=x(1)/x(2);
ny=1/(x(1).*c)-1;
x=[nx;ny];
fprintf("第一个迭代点的");
x=GaussNewton(x,t,d);
x1=1/(c*(x(2)+1));
x2=x1/(x(1));
f1=fx(x,t,d);
fprintf("第一个迭代点的解为("+x1+","+x2+"),最优值为%f\n\n",f1);

%第二个迭代点
x=[-0.01;500];
hold on
plot(x(1),x(2),'go');
hold off
nx=x(1)/x(2);
ny=1/(x(1).*c)-1;
x=[nx;ny];
fprintf("第二个迭代点的");
x=GaussNewton(x,t,d);
x1=1/(c*(x(2)+1));
x2=x1/(x(1));
f2=fx(x,t,d);
fprintf("第二个迭代点的解为("+x1+","+x2+"),最优值为%f\n",f2);

legend("等高线","定义域","(0.00333;333)","迭代路径","迭代点","(-0.01;500)");