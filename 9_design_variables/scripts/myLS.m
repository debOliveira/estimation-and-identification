%% Initial configuration
rng('default') % For reproducibility

% Specifications
N = 600;
e = normrnd(0,1,[1 N]);
u = idinput(N, 'prbs'); 
y = zeros(N,1); phi = zeros(6,1);

% Generate output
for k=4:N
    y(k) = 2.85*y(k-1)-2.717*y(k-2)+0.865*y(k-3)+...
           u(k-1)+u(k-2)+u(k-3)+...
           e(k)+0.7*e(k-1)+0.2*e(k-3);
end
y(314:321)=0;
%% Residue computation
residue = zeros(N,1); R = 0; F = 0;
for k=4:N
    phi = [-y(k-1) -y(k-2) -y(k-3) u(k-1) u(k-2) u(k-3)]';
    psi = phi*y(k);
    R = R + phi*phi';
    F = F + psi;
    theta = R\F;
    y_est = -theta(1)*y(k-1)-theta(2)*y(k-2)-theta(3)*y(k-3)+...
            theta(4)*u(k-1)+theta(5)*u(k-2)+theta(6)*u(k-3);
    residue(k) = y(k)-y_est;
end
%% Plot
figure(), subplot(2,1,1)
plot(y,"LineWidth", 1.2, "Color", lineStyles(1,:)),
xlabel('$t$','Interpreter','Latex'),
ylabel('$y(t)$','Interpreter','Latex'), grid on,
subplot(2,1,2)
plot(residue,"LineWidth", 1.2, "Color", lineStyles(1,:)),
xlabel('$t$','Interpreter','Latex'),
ylabel('$r(t)$','Interpreter','Latex'), grid on,
