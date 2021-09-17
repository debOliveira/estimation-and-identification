%% Initial configuration
rng('default') % For reproducibility

% Specifications
e = normrnd(0,1,[1 N]);
u = idinput(N, 'prbs'); 
y = zeros(N,1); phi = zeros(4,N);
%%
% Generate output
for k=3:N
    y(k) = 1.5*y(k-1)-0.7*y(k-2)+u(k-1)+0.5*u(k-2)+e(k-1);
    phi(:,k) = [-y(k-1) -y(k-2) u(k-1) u(k-2)]';
end
%% Estimation
theta_LS = (inv(phi*phi')*(phi*y))'
