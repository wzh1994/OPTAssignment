function [ alpha ] = linearResearch( x,p,t,d )
%LINEARRESEARCH Summary of this function goes here
%   Detailed explanation goes here
alpha=1;
garma=0.8;
rho=0.01;
f=fx(x,t,d);
g=gx(x,t,d);
while(1)
    nx=x+alpha*p;
    %if (nx(1)>=0.00002||nx(2)<=1)
    if (nx(1)>=0.00002)
        alpha=alpha*garma;
    else
        f_n=fx(nx,t,d);
        if (f_n<=f+rho*alpha*p'*g)
            break;
        end
        alpha=alpha*garma;
    end
end
end

