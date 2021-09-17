%% Initial configuration
x = zeros(1,N); zeta = zeros(4,N);

for k = 3: N
    x(k) = -theta_LS(1)*x(k-1)-theta_LS(2)*x(k-2)+...
           theta_LS(3)*u(k-1)+theta_LS(4)*u(k-2);
    zeta(:,k) = [-x(k-1) -x(k-2) u(k-1) u(k-2)]';
end
%% Estimation
theta_IV_c2 = (inv(zeta*phi')*(zeta*y))'