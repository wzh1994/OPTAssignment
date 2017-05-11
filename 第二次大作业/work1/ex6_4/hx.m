function [ y ] = hx( x )
%HX Summary of this function goes here
%   Detailed explanation goes here
[m,n]=size(x);
y=zeros(m,m);
for i=1:m/2
    x1=x(2*i-1,:);
    x2=x(2*i,:);
    y((2*i-1):2*i,(2*i-1):2*i)=[120*x1^2-40*x2+2 -40*x1;-40*x1 20];
end

end

