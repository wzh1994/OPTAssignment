function [ itera ] = LocalNewton( x )
%LOCALNEWTON Summary of this function goes here
%   Detailed explanation goes here
px=x;
hold on;
plot(x,qx(x),'bo','MarkerSize',5);
for i=1:5
    g=gx(x);
    G=hx(x);
    s=-1*g*inv(G);
    x=x+s;
    if x<=7
        fprintf("本次迭代之后的x为%f.x小于7，f(x)会产生复数，迭代停止。\n上一个x为%f,g为%f,G为%f,s为%f\n",x,x-s,g,G,s);
        x=x-s;
        break;
    end
    px=[px;x];
end
py=qx(px);
itera=[px py];
plot(px,py,'r.-','MarkerSize',5);
plot(x,qx(x),'gx','MarkerSize',5);
hold off;
legend("函数图像","初始点","迭代路径","迭代终点");
end

