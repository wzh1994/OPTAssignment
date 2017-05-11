function [ A ] = Ax( x,t,d )
%A Summary of this function goes here
%   Detailed explanation goes here
    n=size(t,1);
    A=zeros(n,2);
    for i=1:n
        A(i,:)=[-1*t(i)*x(2)*(1-t(i)*x(1)).^(x(2)-1) (1-t(i)*x(1)).^x(2)*log(1-t(i)*x(1))];
    end
end

