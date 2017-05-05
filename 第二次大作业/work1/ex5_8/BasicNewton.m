function [ x ] = BasicNewton( x,mu )
% Summary of this function goes here
%   Detailed explanation goes here
px=x';
for i=1:10
    g=gx(x,mu);
    G=hx(x,mu);
    s=G'*(-1*g);
    x=x+s;
    px=[px;x'];
end
hold on;
plot(px(:,1),px(:,2),'bx-','MarkerSize',5);
hold off;
end

