function [ y ] = subqx( x,G,g )
%SUBQX Summary of this function goes here
%   Detailed explanation goes here
    y=x'*G*x/2+g'*x;

end

