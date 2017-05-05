function [ y ] = hx( x ,mu)
%HX Summary of this function goes here
%   Detailed explanation goes here
x1=x(1);
x2=x(2);
y=[mu/((100-x1-x2)^2)-1/(x1^2)-1/((50-x1+x2)^2),mu/((100-x1-x2)^2)+1/((50-x1+x2)^2);
   mu/((100-x1-x2)^2)+1/((50-x1+x2)^2),mu/((100-x1-x2)^2)-1/(x2^2)-1/((50-x1+x2)^2)];
end

