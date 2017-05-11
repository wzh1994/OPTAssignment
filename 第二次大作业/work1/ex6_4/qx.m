function [ y ] = qx( x )
%QX Summary of this function goes here
%   Detailed explanation goes here
m=size(x,1)/2;
y=0;
for i=1:m
    x1=x(2*i-1,:);
    x2=x(2*i,:);
    y=y+(1-x1).^2+10*(x2-x1.^2).^2;
end

end

