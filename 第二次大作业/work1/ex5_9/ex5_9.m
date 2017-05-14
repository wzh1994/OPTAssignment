clear;clc;
x1=-1.5:0.01:1.5;
x2=-0.7:0.01:1.3;
[px,py]=meshgrid(x1,x2);
pz=qx(px,py);
v=[0.5;1;2;4;8;16;32;64];
x=[1.2 1.2;-1.2 1];
for i=1:2
    x_start=x(i,:)';
    
    fprintf("�����½�����%d����("+x_start(1)+","+x_start(2)+"): ",i);
    subplot(2,2,2*i-1);
    [cs,h]=contour(px,py,pz,v);
    clabel(cs,h);
    hold on
    plot(x_start(1),x_start(2),'bo');
    hold off
    [r,s]=SteepestDescent(x_start);
    hold on
    plot(r(1),r(2),'gx');
    hold off
    k=size(s,2);
    fprintf("��������Ϊ%d,���ŵ�Ϊ("+r(1)+","+r(2)+"):\n",k-1);
    legend("�ȸ���","��ʼ��","����·��","������","Location","SouthWest");
    title("�����½���("+x_start(1)+","+x_start(2)+")");
    
    fprintf("�����½�����%d����("+x_start(1)+","+x_start(2)+"): ",i);
    subplot(2,2,2*i);
    [cs,h]=contour(px,py,pz,v);
    clabel(cs,h);
    hold on
    plot(x_start(1),x_start(2),'bo');
    hold off
    [r,s]=Newton(x_start);
    hold on
    plot(r(1),r(2),'gx');
    hold off
    k=size(s,2);
    fprintf("��������Ϊ%d,���ŵ�Ϊ("+r(1)+","+r(2)+"):\n",k-1);
    legend("�ȸ���","��ʼ��","����·��","������","Location","SouthWest");
    title("ţ�ٷ�("+x_start(1)+","+x_start(2)+")");
end
