% generating fft
[w,E] = myFFT(e,N);
[~,RBS] = myFFT(rbs,N);
% plot
figure()
semilogy(w(1:N/2),RBS(1:N/2),':','LineWidth',1.5,"Color",lineStyles(2,:)); hold on;
semilogy(w(1:N/2),E(1:N/2),'LineWidth',1.2,"Color",lineStyles(1,:)); hold off,
xlabel('$\omega$ (rad/s)','Interpreter','Latex'), grid on
xlim([0,3]), ylim([1e-3, 1e1])
legend("$RBS(\omega)$","$E(\omega)$",'Interpreter','Latex',...
    "Location","best")