clear;clc;
x=[5,8,12,20];
l=[4,5,5,6];
for i=1:4
    [G b]=hx(x(i));
    fprintf("��n=%dʱ��\n",x(i));
    [r,k]=Conjugate(x(i));
    fprintf("����%d�ε��������Ž���(%f",k,r(1));
    for j=2:size(r,1)
        fprintf(",%f",r(j));
    end
    fprintf(")\n");
    nor=norm(gx(r,G,b));
    fprintf("���Ž⴦�ݶȵķ���Ϊ%f\n\n",nor);
    
    [r,k]=Conjugate(x(i),l(i));
    fprintf("����%d�ε������õ��Ľ���(%f",l(i),r(1));
    for j=2:size(r,1)
        fprintf(",%f",r(j));
    end
    fprintf(")\n");
    nor=norm(gx(r,G,b));
    fprintf("�������ݶȵķ���Ϊ%f\n\n",nor);
    
    %-----------------------------------------------
    r=pinv(G)*b;
    fprintf("��pinv����G+*b���õ��Ľ���(%f",r(1));
    for j=2:size(r,1)
        fprintf(",%f",r(j));
    end
    fprintf(")\n");
    nor=norm(gx(r,G,b));
    fprintf("pinv�⴦�ݶȵķ���Ϊ%f\n\n",nor);
    
    [S V D]=svd(G);
    r=D*pinv(V)*S'*b;
    fprintf("������ֵ�ֽ�ֱ�Ӽ���G+*b���õ��Ľ���(%f",r(1));
    for j=2:size(r,1)
        fprintf(",%f",r(j));
    end
    fprintf(")\n");
    nor=norm(gx(r,G,b));
    fprintf("SVD�⴦�ݶȵķ���Ϊ%f\n\n",nor);
    
    r=invhilb(x(i))*b;
    fprintf("�����湫ʽ����(G^-1)*b���õ��Ľ���(%f",r(1));
    for j=2:size(r,1)
        fprintf(",%f",r(j));
    end
    fprintf(")\n");
    nor=norm(gx(r,G,b));
    fprintf("����õ��Ľ⴦�ݶȵķ���Ϊ%f\n\n",nor);
    if i<4
        fprintf("������ͣ������enter����������֮�����������");
        pause;
        clc;
    end
end

