rng('default') % For reproducibility
% generating signals
d = 10;
N = 300;
w = linspace(1,2,d);
u = zeros(4,N); 
t = 1:N;
% sum of senoids
for i=1:d
    u(1,:) = u(1,:) + cos(w(i)*t);
end
% Schroeder choice
phi = zeros(1,d);
for i=2:d
    phi(i) = phi(1)-i*(i-1)*pi/d;
end
for i=1:d
    u(2,:) = u(2,:) + cos(w(i)*t+phi(i));
end
% random phases
phi = randn(1,d);
for i=1:d
    u(3,:) = u(3,:) + cos(w(i)*t+phi(i));
end
% swept cossine
u(4,:) = cos(t+t.^2/2/N);
% plot
figure()
subplot(2,2,1); stairs(u(1,:),"Linewidth",1.2,"Color",lineStyles(1,:)),
xlim([200,300]), ylim([-10,10]), xlabel("$t$",'Interpreter','Latex'),
ylabel("$u(t)$",'Interpreter','Latex'), grid minor
subplot(2,2,2); stairs(u(2,:),"Linewidth",1.2,"Color",lineStyles(2,:)),
xlim([200,300]), ylim([-10,10]), xlabel("$t$",'Interpreter','Latex'),
ylabel("$u_S(t)$",'Interpreter','Latex'), grid minor
subplot(2,2,3); stairs(u(3,:),"Linewidth",1.2,"Color",lineStyles(3,:)),
xlim([200,300]), ylim([-10,10]), xlabel("$t$",'Interpreter','Latex'),
ylabel("$u_R(t)$",'Interpreter','Latex'), grid minor
subplot(2,2,4); stairs(u(4,:),"Linewidth",1.2,"Color",lineStyles(4,:)),
xlim([200,300]), ylim([-1,1]), xlabel("$t$",'Interpreter','Latex'),
ylabel("$u_C(t)$",'Interpreter','Latex'), grid minor