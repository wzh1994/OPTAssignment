function [ itera ] = LocalNewton( x )
%LOCALNEWTON Summary of this function goes here
%   Detailed explanation goes here
px=x;
hold on;
plot(x,qx(x),'bo','MarkerSize',5);
for i=1:5
    g=gx(x);
    G=hx(x);
    s=-1*g*inv(G);
    x=x+s;
    if x<=7
        fprintf("���ε���֮���xΪ%f.xС��7��f(x)���������������ֹͣ��\n��һ��xΪ%f,gΪ%f,GΪ%f,sΪ%f\n",x,x-s,g,G,s);
        x=x-s;
        break;
    end
    px=[px;x];
end
py=qx(px);
itera=[px py];
plot(px,py,'r.-','MarkerSize',5);
plot(x,qx(x),'gx','MarkerSize',5);
hold off;
legend("����ͼ��","��ʼ��","����·��","�����յ�");
end

