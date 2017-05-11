function [ y ] = fx( x,t,d )
%FX Summary of this function goes here
%   Detailed explanation goes here
c=96.05;
[a b]=size(x);
x1=x(1:a/2,:);
x2=x(a/2+1:end,:);
y=zeros(a/2,b);
n=size(t,1);
for i=1:n
    y=y+((1-t(i).*x1).^x2-d(i)).^2;
end
end

