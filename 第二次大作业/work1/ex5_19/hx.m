function [ y,b ] = hx(dim )
%HX Summary of this function goes here
%   Detailed explanation goes here
y=zeros(dim,dim);
for i=1:dim
    for j=1:dim
        y(i,j)=1/(i+j-1);
    end
end
b=ones(dim,1);
end

