%% Model 1
% Initial configuration
y = y1;
theta = zeros(2,length(y));
R = 0;
F = 0;
% Estimation
for k=3:N
    phi = [-y(k-1) u(k-1)]';
    psi = phi*y(k);
    R = R + phi*phi';
    F = F + psi;
    theta(:,k) = R\F;
end
% Plot
figure()
subplot(2,1,1)
plot(theta(1,:),'LineWidth',1.5,...
         'color',lineStyles(1,:)), hold on;
plot(1:N,ones(size(theta(1,:)))*-0.8,'--', ...
    'LineWidth',1.2,'color',lineStyles(1,:));
plot(theta(2,:),'LineWidth',1.5,...
         'color',lineStyles(2,:));
plot(1:N,ones(size(theta(2,:))),'--', ...
    'LineWidth',1.2,'color',lineStyles(2,:)), hold off;
ylabel('$\hat{a}_1, \hat{b}_1(t)$','Interpreter','Latex'),
xlabel('$t (s)$','Interpreter','Latex');
ylim([-1.5 1.5]);
legend('$\hat{a}_1(t)$','','$\hat{b}_1(t)$',...
        'Interpreter','Latex',...
        'Location', "best"); grid;
%% Model 2    
% Initial configuration
y = y2;
theta = zeros(2,length(y));
R = 0;
F = 0;
% Estimation
for k=3:N
    phi = [-y(k-1) u(k-1)]';
    psi = phi*y(k);
    R = R + phi*phi';
    F = F + psi;
    theta(:,k) = R\F;
end
% Plot
subplot(2,1,2)
plot(theta(1,:),'LineWidth',1.5,...
         'color',lineStyles(1,:)), hold on;
plot(1:N,ones(size(theta(1,:)))*-0.8,'--', ...
    'LineWidth',1.2,'color',lineStyles(1,:));
plot(theta(2,:),'LineWidth',1.5,...
         'color',lineStyles(2,:));
plot(1:N,ones(size(theta(2,:))),'--', ...
    'LineWidth',1.2,'color',lineStyles(2,:)), hold off;
ylabel('$\hat{a}_2, \hat{b}_2(t)$','Interpreter','Latex'),
xlabel('$t (s)$','Interpreter','Latex');
ylim([-1.5 1.5]);
legend('$\hat{a}_2(t)$','','$\hat{b}_2(t)$',...
        'Interpreter','Latex',...
        'Location', "best"); grid;