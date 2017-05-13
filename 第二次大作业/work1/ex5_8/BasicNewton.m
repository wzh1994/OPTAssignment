function [ x ] = BasicNewton( x,mu )
% Summary of this function goes here
%   Detailed explanation goes here
px=x';
for i=1:2
    g=gx(x,mu);
    G=hx(x,mu);
    s=pinv(G)*(-1*g);
    x=x+s;
    px=[px;x'];
    if (x(1)+x(2)>=100||x(1)-x(2)>=50||x(1)<=0||x(2)<=0)
        fprintf("本次迭代(%f,%f)迭代之后超出定义域。\n此点处梯度为[%f;%f].Hessian阵为[%f %f;%f %f]\n本次迭代的步长为(%f,%f),迭代之后的点为(%f,%f)\n",x-s,g,G(1,:),G(2,:),s,x);
        break;
    end
end
hold on;
plot(px(:,1),px(:,2),'bx-','MarkerSize',5);
hold off;
end

