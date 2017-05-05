function [ z ] = qx( x,y,mu )
%QX Summary of this function goes here
%   Detailed explanation goes here
z=-9*x-10*y-mu*(log(100-x-y)+log(x)+log(y)+log(50-x+y));
end

