%% Initial configuration
x = zeros(1,N); zeta = zeros(4,N);

for k = 3: N
    x(k) = u(k-2);
    zeta(:,k) = [-x(k-1) -x(k-2) u(k-1) u(k-2)]';
end
%% Estimation
theta_IV_c1 = (inv(zeta*phi')*(zeta*y))'