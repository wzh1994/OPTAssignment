function [ alpha ] = linearSearch( x,p )
%LINEARSEARCH Summary of this function goes here
%   Detailed explanation goes here
    alpha=1;
    garma=0.1;
    rou=0.01;
    while(1)
        x_n=x+alpha*p;
        if(alpha<10^-30||qx(x_n(1),x_n(2))<qx(x(1),x(2))+alpha*rou*p'*gx(x))
            break;
        end
        alpha=alpha*garma;
    end
end

