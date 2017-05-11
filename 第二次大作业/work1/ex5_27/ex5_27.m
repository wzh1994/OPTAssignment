clear;clc;
t=[2000;5000;10000;20000;30000;50000];
d=[0.9427;0.8616;0.7384;0.5362;0.3739;0.3096];
c=96.05;
%x=-0.51:0.02:0.51;
%y=-0.51:0.02:0.51;
%[px py]=meshgrid(x,y);
%nx=px./py;
%ny=1./(px.*c)-1;
%z=abs(fx([nx;ny],t,d));

%第一个迭代点
x=[0.00333;333];
nx=x(1)/x(2);
ny=1/(x(1).*c)-1;
x=[nx;ny];
f=fx(x,t,d)
x=GaussNewton(x,t,d);
f=fx(x,t,d)

%第二个迭代点
x=[-0.01;500];
nx=x(1)/x(2);
ny=1/(x(1).*c)-1;
x=[nx;ny]
f=fx(x,t,d)
x=GaussNewton(x,t,d)
f=fx(x,t,d)
%contour(px,py,z,10);