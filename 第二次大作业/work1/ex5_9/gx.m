function [ y ] = gx( x )
%GX Summary of this function goes here
%   Detailed explanation goes here
x1=x(1,:);
x2=x(2,:);
y=[400*x1.^3-400*x1.*x2+2*x1-2;200*x2-200*x1.^2];

end

