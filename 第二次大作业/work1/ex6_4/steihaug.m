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
    fprintf("����������������ݶ�Ϊ0");
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
            fprintf("�����⾭��%d�ε���,������������ֹͣ������",cyc);
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
                fprintf("�����⾭��%d�ε���,�ﵽ�߽�ֹͣ����,�����Ħ�Ϊ%f��",cyc,tau1);
            else 
                x=x_o+tau2*p;
                fprintf("�����⾭��%d�ε���,�ﵽ�߽�ֹͣ����,�����Ħ�Ϊ%f��",cyc,tau2);
            end
            s=x;
            break;
        end
        r_old=r;
        r=r+alpha*G*p;
        if (norm(r)<epsilon*norm(r_old))
            s=x;
            fprintf("�����⾭��%d�ε���,����ֹͣ����ֹͣ������",cyc);
            break;
        end
        beta=r'*r/(r_old'*r_old);
        p=-r+beta*p;
    end
end

