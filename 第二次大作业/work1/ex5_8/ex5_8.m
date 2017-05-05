clear;clc;
x1=0.1:0.1:100;
x2=0.1:0.1:100;
[px,py]=meshgrid(x1,x2);
idl = px + py >= 100;
px(idl)=nan;
py(idl)=nan;
idl = px - py >= 50;
px(idl)=nan;
py(idl)=nan;
%u=1
mu=1;
figure(1);
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
    legend("等高线","定义域")
    hold off
    BasicNewton(x(i,:)',mu);
end
