clear;clc;
x=zeros(20,1);
fprintf("��n=10ʱ��");
x=trust(x);
fprintf("\n���Ž��ǣ�\n");
for i=1:2
    fprintf("%.2f,%.2f,%.2f,%.2f,%.2f,%.2f,%.2f,%.2f,%.2f,%.2f\n",x((10*i-9):10*i));
end

x=zeros(100,1);
fprintf("\n��n=50ʱ��");
x=trust(x)';
fprintf("\n");
fprintf("\n���Ž��ǣ�\n");
for i=1:10
    fprintf("%.2f,%.2f,%.2f,%.2f,%.2f,%.2f,%.2f,%.2f,%.2f,%.2f\n",x((10*i-9):10*i));
end