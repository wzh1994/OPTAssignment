function [ x,i ] = LinearNewton( x,mu )
%LINEARNEWTON Summary of this function goes here
%   Detailed explanation goes here
px=x';
g=gx(x,mu);
pg=[0;0];
i=0;
while 1
    if (norm(g-pg)<10^-6) 
        break;
    end
    i=i+1;
    G=hx(x,mu);
    [V,D]=eig(G);
    G=G+(abs(min(min(D)))+0.5)*eye(2);
    p=inv(G)*(-1*g);
    % linear search
    alpha=1;
    garma=0.9;
    rou=0.01;
    while(1)
        new_x=x+alpha*p;
        if (alpha<10^-200||new_x(1)>0&&new_x(2)>0&&new_x(1)+new_x(2)<100&&new_x(1)-new_x(2)<50&&qx(new_x(1),new_x(2),mu)<qx(x(1),x(2),mu)+rou*alpha*p'*g)
           break; 
        end
        alpha=garma*alpha;
    end
    x=x+alpha*p;
    pg=g;
    g=gx(x,mu);
    px=[px;x'];
end
hold on;
plot(px(:,1),px(:,2),'b-','MarkerSize',5);
hold off;
end

