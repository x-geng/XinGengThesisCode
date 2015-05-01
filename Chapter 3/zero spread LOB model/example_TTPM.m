function example_TTPM

Q=50;

[x,M]=blockexponential;
x1=20;

a=-7:0.05:7;
n=length(a);
C=zeros(1,n);

for i=1:n
    b=a(i);
    c=Q-x1-b;
    y=[x1;b;c];

    C(i)=1/2*y'*M*y;
end
z=0;

plot(a,C)
xlabel('\xi_1');
ylabel('Liquidation cost');
 
hold on
plot(z,C)


end