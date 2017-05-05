function [ x ] = LocalNewton( x )
%LOCALNEWTON Summary of this function goes here
%   Detailed explanation goes here
px=x;
for i=1:5
    g=gx(x);
    G=hx(x);
    s=-1*g*inv(G);
    x=x+s;
    px=[px;x];
end
py=qx(px);
itera=[px py]
hold on;
plot(px,py,'rx-','MarkerSize',5);
hold off;
end

