%
clc
clear all
close all
%% random number generator
rng('default'); % for reproducibility
%
b1=0.5;
b2=0.2;
f1=0.8;
%
model=idpoly([],[0  b1 b2],[],[],[1 f1]); 
n=511;
u=idinput(n,'prbs',[0 1],[-1 1]);
k=0:(length(u)-1);
s0=sqrt(0.7071);
e=s0*randn(n,1);
y=sim(model,u);
%% ruído de medição 
ymed=y+e;
%
figure(1)
subplot(2,1,1), stem(k,u, 'filled'), title('Input'); 
grid; ylim([-1.2,1.2]); xlim([0,50]); 
xlabel('$k$','Interpreter','Latex');
ylabel('$u(k)$', 'Interpreter','Latex');
subplot(2,1,2), stem(k,y, 'filled'), title('Output'); 
hold on; xlim([0,50]); grid on;
plot(k,ymed, ':', 'Linewidth', 2), hold off;
xlabel('$k$','Interpreter','Latex'),
ylabel('$y(k),y(k)+e(k)$','Interpreter','Latex');
legend('$y(k)$','$y(k)+e(k)$','Interpreter','Latex','Location', "best");