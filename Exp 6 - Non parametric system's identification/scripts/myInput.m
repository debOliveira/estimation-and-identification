%% Initial configuration
lineStyles = linspecer(3);
rng('default') % For reproducibility
close all

% Specifications
N = 1000;
e = normrnd(0,1,[1 N]);
u = idinput(N, 'prbs'); 
y = zeros(1,N);
Fs = 1;
% Generate output
for k=3:N
    y(k) = 1.5*y(k-1)-0.7*y(k-2)+u(k-1)+0.5*u(k-2)+e(k-1);
end

% Plot
figure("position",[100 100 500 400]);
subplot(3,1,1)
plot(u,'LineWidth',1.2,"Color",lineStyles(1,:))
ylabel('$u(t)$','Interpreter','Latex'),
xlabel('$t (s)$','Interpreter','Latex');
xlim([0,200]); ylim([-1.1 1.1]); grid;
subplot(3,1,2)
plot(e,'LineWidth',1.2,"Color",lineStyles(2,:))
ylabel('$e(t)$','Interpreter','Latex'),
xlabel('$t (s)$','Interpreter','Latex');
xlim([0,200]); grid;
subplot(3,1,3)
plot(y,'LineWidth',1.2,"Color",lineStyles(3,:))
ylabel('$y(t)$','Interpreter','Latex'),
xlabel('$t (s)$','Interpreter','Latex');
xlim([0,200]); grid;