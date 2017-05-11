function [ y ] = gx( x,t,d )
%GX Summary of this function goes here
%   Detailed explanation goes here
y=zeros(size(x));
m=size(t,1);
r=rx(x,t,d);
x1=x(1);
x2=x(2);
for i=1:m
    y=y+(r(i)-d(i))*[-1*t(i)*x2*(1-t(i)*x1).^(x2-1);(1-t(i)*x1).^x2*log(1-t(i)*x1)];
end
end

