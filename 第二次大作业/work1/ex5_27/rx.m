function [ r ] = rx( x,t,d )
%R Summary of this function goes here
%   Detailed explanation goes here
c=96.05;
x1=x(1);
x2=x(2);
r=(1-x1*t).^x2-d;
end

