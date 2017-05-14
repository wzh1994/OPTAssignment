clear;clc;
x=[5,8,12,20];
l=[4,5,5,6];
for i=1:4
    [G b]=hx(x(i));
    fprintf("当n=%d时：\n",x(i));
    [r,k]=Conjugate(x(i));
    fprintf("经过%d次迭代，最优解是(%f",k,r(1));
    for j=2:size(r,1)
        fprintf(",%f",r(j));
    end
    fprintf(")\n");
    nor=norm(gx(r,G,b));
    fprintf("最优解处梯度的范数为%f\n\n",nor);
    
    [r,k]=Conjugate(x(i),l(i));
    fprintf("经过%d次迭代，得到的解是(%f",l(i),r(1));
    for j=2:size(r,1)
        fprintf(",%f",r(j));
    end
    fprintf(")\n");
    nor=norm(gx(r,G,b));
    fprintf("这个点的梯度的范数为%f\n\n",nor);
    
    %-----------------------------------------------
    r=pinv(G)*b;
    fprintf("用pinv计算G+*b，得到的解是(%f",r(1));
    for j=2:size(r,1)
        fprintf(",%f",r(j));
    end
    fprintf(")\n");
    nor=norm(gx(r,G,b));
    fprintf("pinv解处梯度的范数为%f\n\n",nor);
    
    [S V D]=svd(G);
    r=D*pinv(V)*S'*b;
    fprintf("用奇异值分解直接计算G+*b，得到的解是(%f",r(1));
    for j=2:size(r,1)
        fprintf(",%f",r(j));
    end
    fprintf(")\n");
    nor=norm(gx(r,G,b));
    fprintf("SVD解处梯度的范数为%f\n\n",nor);
    
    r=invhilb(x(i))*b;
    fprintf("用求逆公式计算(G^-1)*b，得到的解是(%f",r(1));
    for j=2:size(r,1)
        fprintf(",%f",r(j));
    end
    fprintf(")\n");
    nor=norm(gx(r,G,b));
    fprintf("求逆得到的解处梯度的范数为%f\n\n",nor);
    if i<4
        fprintf("程序暂停，输入enter继续，继续之后将清空命令行");
        pause;
        clc;
    end
end

