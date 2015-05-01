function [x1,x2,x3,x4]=plotRho(N,T)


[x1,alpha1]=blockexponential(N, 0.1,T);
[x2,alpha2]=blockexponential(N, 1,T);
[x3,alpha3]=blockexponential(N, 2,T);
[x4,alpha4]=blockexponential(N, 5,T);

z=1:N+1;


subplot(2,2,1)
hold on
bar(z,x1)
plot(z,alpha1,'-.')
hold off
xlabel('Time');
ylabel('Order size');

subplot(2,2,2)
hold on
bar(z,x2)
plot(z,alpha2,'-.')
hold off
xlabel('Time');
ylabel('Order size');

subplot(2,2,3)
hold on
bar(z,x3)
plot(z,alpha3,'-.')
hold off
xlabel('Time');
ylabel('Order size');

subplot(2,2,4)
hold on
bar(z,x4)
plot(z,alpha4,'-.')
hold off
xlabel('Time');
ylabel('Order size');



end