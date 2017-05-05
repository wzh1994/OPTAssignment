function [ y ] = gx( x ,mu)
%GX Summary of this function goes here
%   Detailed explanation goes here
x1=x(1);
x2=x(2);
y=[-9+mu/(100-x1-x2)+1/x1-1/(50-x1+x2);-10+mu/(100-x1-x2)+1/x2+1/(50-x1+x2)];
end

