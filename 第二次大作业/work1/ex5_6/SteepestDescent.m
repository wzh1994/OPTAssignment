function [ x,s ] = SteepestDescent( x ,line)
%FASTESTDECENT Summary of this function goes here
%   Detailed explanation goes here

g=gx(x);
G=[10,-9;-9,10];
plx=x';
f=qx(x(1),x(2));
while (norm(g)>10^-6)
    alpha=g'*g/(g'*G*g);
    x=x-alpha*g;
    bf=f;
    plx=[plx;x'];
    f=qx(x(1),x(2));
    s=(f+22)/(bf+22);
    g=gx(x);
end
hold on;
plot(plx(:,1),plx(:,2),line,'MarkerSize',2);
hold off;
end

