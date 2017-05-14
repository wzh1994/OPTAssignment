function [ x,step] = SteepestDescent( x )
%SPEEDESTDESCENT Summary of this function goes here
%   Detailed explanation goes here
px=x';
step=[];
while(1)
    g=gx(x);
    if (norm(g)<10^-6) 
        break;
    end
    p=-1*g;
    alpha=linearSearch(x,p);
    s=alpha*p;
    step=[step [x;alpha;s]];
    x=x+s;
    px=[px;x'];
end
hold on
plot(px(:,1),px(:,2),'rx-','MarkerSize',3);
hold off
end

