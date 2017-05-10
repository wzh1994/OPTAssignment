function [ x ] = LinearNewton( x,mu )
%LINEARNEWTON Summary of this function goes here
%   Detailed explanation goes here
px=x';
for i=1:100
    g=gx(x,mu);
    if (abs(g)<10^-6) 
        break;
    end
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
        if (alpha<10^-20||new_x(1)>0&&new_x(2)>0&&new_x(1)+new_x(2)<100&&new_x(1)-new_x(2)<50&&qx(new_x(1),new_x(2),mu)<qx(x(1),x(2),mu)+rou*alpha*p'*g)
           break; 
        end
        alpha=garma*alpha;
    end
    x=x+alpha*p;
    px=[px;x'];
end
hold on;
plot(px(:,1),px(:,2),'bx-','MarkerSize',5);
hold off;
end

