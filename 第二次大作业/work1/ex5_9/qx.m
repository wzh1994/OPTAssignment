function [ y ] = qx( x1,x2 )
%QX Summary of this function goes here
%   Detailed explanation goes here
y=100*(x2-x1.^2).^2+(1-x1).^2;
end

