function [ x ] = trust( x )
%TRUST Summary of this function goes here
%   Detailed explanation goes here
delta=2;
cyc=0;
while(1)
    g=gx(x);
    if (norm(g)<10^-6) 
        break;
    end
    G=hx(x);
    cyc=cyc+1;
    fprintf("��%d�ε���:",cyc);
    s=steihaug(g,G,delta);
    f=qx(x+s);
    f_o=qx(x);
    q=subqx(s,G,g);
    rho=(f-f_o)/q; %�˴���Ϊ�����qʱ��û�м�f0 ��˷�ĸ������f0-q��Ӧ����-q
    fprintf("��Ϊ%f,��Ϊ%f,s�ĵڶ�����Ϊ%f,����������sΪ:\n",delta,rho,norm(s));
    sz=size(s,1)/20;
    for i=1:sz
        fprintf('%d-%d:%f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f\n',(i-1)*20+1,20*i,s((i-1)*20+1:i*20,:));
    end
    %if (norm(s)<10^-10)
    %     break;
    %end
    if (rho<0.25)
        delta=norm(s)/4;
    elseif (rho>0.75&&abs(norm(s)-delta)<10^-2)
        delta=2*delta;
    end
    if (rho>0)
        x=x+s;
    end
    fprintf('����֮���x��:\n');
    for i=1:sz
        fprintf('%d-%d:%f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f\n',(i-1)*20+1,20*i,x((i-1)*20+1:i*20,:));
    end
end

end

