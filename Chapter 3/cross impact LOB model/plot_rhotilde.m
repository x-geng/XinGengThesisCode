function plot_rhotilde

rhotilde=1:1:50;
n=length(rhotilde);
C=zeros(1,n);

for i=1:n
    C(i)=crossimpactCost(rhotilde(i));
end

plot(rhotilde,C,'*-')
xlabel('$\beta$','Interpreter','LaTex');
ylabel('$C^*$','Interpreter','Latex');

hold on

a=ones(1,n);
calfonsi=179.9584*a;
plot(rhotilde,calfonsi)

hold off
legend('Cross impact cost','Zero spread cost')

end