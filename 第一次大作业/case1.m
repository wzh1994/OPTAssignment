a=[1,1,1,0,-1,0,0,0,0,0,0,0,0;
  -1,0,0,1,0,0,0,0,-1,0,0,0,0;
  0,-1,0,0,1,1,0,0,0,0,0,0,0;
  0,0,-1,0,0,0,1,1,0,0,-1,0,0;
  0,0,0,-1,0,0,-1,0,1,1,0,0,-1;
  0,0,0,0,0,-1,0,-1,0,0,1,1,0;
  0,0,0,0,0,0,0,0,0,-1,0,-1,1];
b1=[4;-4;0;0;0;0;0];
b2=[4;0;-4;0;0;0;0];
b3=[0;-4;4;0;0;0;0];
b4=[4;0;0;0;0;0;-4];
A=[a,zeros(7,13),zeros(7,13),zeros(7,13),zeros(7,1);
    zeros(7,13),a,zeros(7,13),zeros(7,13),zeros(7,1);
   zeros(7,13),zeros(7,13),a,zeros(7,13),zeros(7,1);
    zeros(7,13),zeros(7,13),zeros(7,13),a,zeros(7,1)];
b=[b1;b2;b3;b4];
size(A)
size(b)
B=[1/5*eye(13),1/5*eye(13),1/5*eye(13),1/5*eye(13),-1*ones(13,1);
    -1*eye(13),zeros(13),zeros(13),zeros(13),zeros(13,1);
    zeros(13),-1*eye(13),zeros(13),zeros(13),zeros(13,1)
    zeros(13),zeros(13),-1*eye(13),zeros(13),zeros(13,1)
    zeros(13),zeros(13),zeros(13),-1*eye(13),zeros(13,1)];
d=zeros(65,1);
c=[zeros(52,1);1];
[x,fval]=linprog(c,B,d,A,b,[],[]);
reslut=[x(1:13,1:1),x(14:26,1:1),x(27:39,1:1),x(40:52,1:1)]
opt=fval




