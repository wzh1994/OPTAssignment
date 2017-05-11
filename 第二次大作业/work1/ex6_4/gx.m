function [ y ] = gx( x )
%GX Summary of this function goes here
%   Detailed explanation goes here
[m,n]=size(x);
y=zeros(m,n);
for i=1:m/2
    x1=x(2*i-1,:);
    x2=x(2*i,:);
    y(2*i-1,:)=40*x1.^3-40*x1.*x2+2*x1-2;
    y(2*i,:)=20*x2-20*x1.^2;
end

end

