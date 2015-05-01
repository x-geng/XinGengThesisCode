function y=netstrategy(x,N)

y=zeros(N,1);

for i=1:N
    y(i)=x(i)-x(i+N);
end

end