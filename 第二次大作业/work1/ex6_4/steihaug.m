function [ s ] = steihaug( g,G,delta )
%STEIHAUG Summary of this function goes here
%   Detailed explanation goes here
epsilon=10^-6;
r=g;
p=-g;
x=zeros(size(g));
cyc=0;
if (norm(r)<epsilon)
    s=x;
    fprintf("子问题无需迭代，梯度为0");
else
    while(1)
        cyc=cyc+1;
        if (p'*G*p<=0)
            tau1=(-1*p'*x+sqrt((p'*x).^2-p'*p*(x'*x-delta^2)))/(p'*p);
            tau2=(-1*p'*x-sqrt((p'*x).^2-p'*p*(x'*x-delta^2)))/(p'*p);
            if (subqx(x+tau1,G,g)<subqx(x+tau2,G,g))
                x=x+tau1*p;
            else 
                x=x+tau2*p;
            end
            s=x;
            fprintf("子问题经过%d次迭代,遇到非正曲率停止迭代。",cyc);
            break;
        end 
        alpha=r'*r/(p'*G*p);
        x_o=x;
        x=x+alpha*p;
        if (norm(x)>=delta)
            tau1=(-1*p'*x_o+sqrt((p'*x_o).^2-p'*p*(x_o'*x_o-delta^2)))/(p'*p);
            tau2=(-1*p'*x_o-sqrt((p'*x_o).^2-p'*p*(x_o'*x_o-delta^2)))/(p'*p);
            if (subqx(x_o+tau1,G,g)<subqx(x_o+tau2,G,g))
                x=x_o+tau1*p;
                fprintf("子问题经过%d次迭代,达到边界停止迭代,迭代的τ为%f。",cyc,tau1);
            else 
                x=x_o+tau2*p;
                fprintf("子问题经过%d次迭代,达到边界停止迭代,迭代的τ为%f。",cyc,tau2);
            end
            s=x;
            break;
        end
        r_old=r;
        r=r+alpha*G*p;
        if (norm(r)<epsilon*norm(r_old))
            s=x;
            fprintf("子问题经过%d次迭代,满足停止条件停止迭代。",cyc);
            break;
        end
        beta=r'*r/(r_old'*r_old);
        p=-r+beta*p;
    end
end

