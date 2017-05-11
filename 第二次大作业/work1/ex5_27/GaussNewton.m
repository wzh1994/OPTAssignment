function [ x ] = GaussNewton( x,t,d )
%GAUSSNEWTON Summary of this function goes here
%   Detailed explanation goes here
c=96.05;
lambda=1;
px=x';
while(1)
%for i=1:30
    r=rx(x,t,d);
    a=Ax(x,t,d);
    A=a'*a;
    A=A+lambda*eye(2,2);
    p=-1*pinv(A)*a'*r;
    alpha=linearResearch(x,p,t,d);
    s=alpha*p;
    f=fx(x,t,d);
    fn=fx(x+s,t,d);
    rou=(f-fn)/(f-norm(r+a*s).^2/2);
    if (rou>0)
        x=x+s;
        px=[px;x'];
    end
    if (rou<0.25)
        lambda=2*lambda;
    elseif (rou>0.75)
        lambda=lambda/2;
    end
    if (lambda<10^-20||abs(rou)<10^-5) 
        break;
    end
end
    prex=px;
    prex(:,1)=1./(c*(1+px(:,2)));
    prex(:,2)=prex(:,1)./px(:,1);
    %hold on
    plot(prex(:,1),prex(:,2),'rx-');
    %hold off
end

