% generating fft
U = zeros(4,N); 
[w,U(1,:)] = myFFT(u(1,:),N);
[~,U(2,:)] = myFFT(u(2,:),N);
[~,U(3,:)] = myFFT(u(3,:),N);
[~,U(4,:)] = myFFT(u(4,:),N);
% plot
figure()
semilogy(w(1:N/2),U(1,1:N/2),':','LineWidth',1.8,"Color",lineStyles(1,:)); hold on;
semilogy(w(1:N/2),U(2,1:N/2),'LineWidth',1.2,"Color",lineStyles(2,:));
semilogy(w(1:N/2),U(3,1:N/2),'-.','LineWidth',1.5,"Color",lineStyles(3,:));
semilogy(w(1:N/2),U(4,1:N/2),'LineWidth',1.6,"Color",lineStyles(4,:)); hold off,
xlabel('$\omega$ (rad/s)','Interpreter','Latex'), grid on
xlim([0,3]), ylim([1e-2, 1e1])
legend("$U(\omega)$","$U_S(\omega)$","$U_R(\omega)$","$U_C(\omega)$",...
    'Interpreter','Latex',...
    "Location","best")