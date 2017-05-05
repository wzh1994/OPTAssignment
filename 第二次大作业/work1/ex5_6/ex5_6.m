clear;
clc;
[x,y] = meshgrid(-3:.2:12);
z=qx(x,y);
contour(x,y,z,100);
x=[0;0]; 
[x1,s1]=SteepestDescent(x,'r+-');
x=[-0.4;0];
[x2,s2]=SteepestDescent(x,'bo-');
x=[10;0];
[x3,s3]=SteepestDescent(x,'g.-');
x=[11;0];
[x4,s4]=SteepestDescent(x,'y+-');
x=[x1';x2';x3';x4']
s=[s1;s2;s3;s4]
max=max(s)
legend("µÈ¸ßÏß","(0,0)","(0.4,0)","(10,0)","(11,0)");
