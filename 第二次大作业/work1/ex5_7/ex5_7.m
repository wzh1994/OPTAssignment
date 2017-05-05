clear;clc;
px = (7.01:0.01:8.4)';
py=qx(px);

x=[7.40 7.20 7.01 7.80 7.88];
for i=1:5
    subplot(2,3,i);
    plot(px,py);
    xlabel('x');
    ylabel('f(x)');
    LocalNewton(x(i));
end

subplot(2,3,6);
plot(px,py);
xlabel('x');
ylabel('f(x)');
LocalNewton(7.8889);