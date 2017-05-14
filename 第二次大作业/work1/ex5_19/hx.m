function [ G,b ] = hx(dim )
%HX Summary of this function goes here
%   Detailed explanation goes here
G=hilb(dim);
b=ones(dim,1);
end

