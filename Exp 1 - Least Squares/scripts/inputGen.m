%% Initial configuration
lineStyles = linspecer(4);
rng('default') % For reproducibility
%% Specifications
N = 200;
onePeriod = [ones(1,25) -1*ones(1,25)];
%
e = normrnd(0,1,[1 N]);
u = normrnd(0,1,[1 N]);
y1 = zeros(1,N); y2 = zeros(1,N); 
%
for k=2:N
    y1(k) = -0.8*-y1(k-1) + u(k-1) + e(k-1);
    y2(k) = -0.8*-y2(k-1) + u(k-1) + e(k) - 0.8*e(k-1);
end
%% Plot
figure();
subplot(2,1,1)
plot(u,'LineWidth',1,"Color",lineStyles(1,:)), hold on;
plot(e,':','LineWidth',1.5,"Color",lineStyles(2,:)), hold off;
ylabel('$u(t),e(t)$','Interpreter','Latex'),
xlabel('$t (s)$','Interpreter','Latex');
legend('$u(t)$','$e(t)$',...
        'Interpreter','Latex',...
        'Location', "best"); grid;
subplot(2,1,2)
plot(y1,'LineWidth',1.2,"Color",lineStyles(3,:)),hold on;
plot(y2,':','LineWidth',1.5,"Color",lineStyles(4,:)), hold off;
ylabel('$y(t)$','Interpreter','Latex'),
xlabel('$t (s)$','Interpreter','Latex');
legend('$y_1(t)$','$y_2(t)$',...
        'Interpreter','Latex',...
        'Location', "best"); grid;