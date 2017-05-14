function [ x,k ] = Conjugate(varargin)
%CONJUGATE Summary of this function goes here
%   Detailed explanation goes here
narginchk(1,2);
dim=varargin{1};
if nargin==2
    loop=varargin{2};
end
x=zeros(dim,1);
[G,b]=hx(dim);
g=gx(x,G,b);
p=-g;
k=0;
while(nargin==1&&norm(g)>10^-6||nargin==2&&k<loop)
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

