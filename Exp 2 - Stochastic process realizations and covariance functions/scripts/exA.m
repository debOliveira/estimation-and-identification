%% Initial configuration
lineStyles = linspecer(4);
rng('default') % For reproducibility
close all
%% Specifications
N = 200;
%
e = normrnd(0,1,[1 N]);
v = zeros(1,N);  
%
for k=3:N
    v(k) = e(k) + 0.5*e(k-1) + 1.5*v(k-1)-0.7*v(k-2);
end
%% Periodogram
[pxx,w] = periodogram(v);
figure("position",[100 100 500 400]); 
loglog(w(3:end),pxx(3:end),'LineWidth',1.2,"Color",lineStyles(1,:));
hold on; 

% Open DFT
% V = zeros(1,length(w));
% for i = 1:length(w)
%     a = 0;
%     for k = 1:N
%         a = a + v(k)*exp(-1j*w(i)*k);
%     end
%     V(i) = a/sqrt(N);
% end
% figure();
% loglog(w,abs(V).^2)
%% Spectra
syms q
H = (1+0.5*q)/(1-1.5*q+0.7*q^2);
w = logspace(-2,1,N);
phi = vpa(abs(subs(H,q,exp(-1j*w)))).^2;

loglog(w,phi,':','LineWidth',1.5,"Color",lineStyles(2,:))
ylim([1e-1 1e3]), xlim([4e-2 0.4e1]), hold off;
xlabel('$\omega$','Interpreter','Latex'),
ylabel('$|V_n(\omega)|^2,\Phi_v(\omega)$','Interpreter','Latex'),
legend('$|V_n(\omega)|^2$','$\Phi_v(\omega)$',...
        'Interpreter','Latex',...
        'Location', "best"); grid;
