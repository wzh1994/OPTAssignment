function [ x,k ] = Conjugate(dim)
%CONJUGATE Summary of this function goes here
%   Detailed explanation goes here
x=zeros(dim,1);
[G,b]=hx(dim);
g=gx(x,G,b);
p=-g;
k=0;
while(norm(g)>10^-6)
    d=G*p;
    alpha=g'*g/(p'*d);
    x=x+alpha*p;
    old_g=g;
    g=g+alpha*d;
    beta=g'*g/(old_g'*old_g);
    p=-g+beta*p;
    k=k+1;
end
end

