%function plotTN(n1,n2,t1,t2)
function plotTN(n1,n2,n3,n4,T)

rho=2;

x1=blockexponential(n1, rho,T)
x2=blockexponential(n2, rho,T);
x3=blockexponential(n3, rho,T);
x4=blockexponential(n4, rho,T);

d1=getE(n1,T,x1,rho)
d2=getE(n2,T,x2,rho);
d3=getE(n3,T,x3,rho);
d4=getE(n4,T,x4,rho);

c1=d1-x1(2:end-1)
cumsum(c1,1)
c2=d2-x2(2:end-1)
cumsum(c2,1)
c3=d3-x3(2:end-1)
cumsum(c3,1)
c4=d4-x4(2:end-1)
cumsum(c4,1)

subplot(2,2,1)
z1=1:n1+1;
bar(z1,x1)
xlabel('Time');
ylabel('Order size');

subplot(2,2,2)
z2=1:n2+1;
bar(z2,x2)
xlabel('Time');
ylabel('Order size');

subplot(2,2,3)
z3=1:n3+1;
bar(z3,x3)
xlabel('Time');
ylabel('Order size');

subplot(2,2,4)
z4=1:n4+1;
bar(z4,x4)
xlabel('Time');
ylabel('Order size');


end