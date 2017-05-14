clear;clc;
x=zeros(20,1);
fprintf("当n=10时：");
x=trust(x);
fprintf("\n最优解是：\n");
for i=1:2
    fprintf("%.2f,%.2f,%.2f,%.2f,%.2f,%.2f,%.2f,%.2f,%.2f,%.2f\n",x((10*i-9):10*i));
end

x=zeros(100,1);
fprintf("\n当n=50时：");
x=trust(x)';
fprintf("\n");
fprintf("\n最优解是：\n");
for i=1:10
    fprintf("%.2f,%.2f,%.2f,%.2f,%.2f,%.2f,%.2f,%.2f,%.2f,%.2f\n",x((10*i-9):10*i));
end