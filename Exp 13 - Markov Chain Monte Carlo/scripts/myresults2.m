figure()
subplot(4,1,1);plot(b1est(nburn:nstate), 'Linewidth',1.2); ylabel('b1');
hold on; yline(b1,'--','Linewidth',1.2,'Color','r'); grid, hold off;
ylabel('$b_1$','Interpreter','Latex');
legend('Estimate', 'Real value', 'Location', 'best');
subplot(4,1,2);plot(b2est(nburn:nstate), 'Linewidth',1.2); ylabel('b2');
hold on; yline(b2,'--','Linewidth',1.2,'Color','r'); grid, hold off;
ylabel('$b_2$','Interpreter','Latex');
subplot(4,1,3);plot(f1est(nburn:nstate), 'Linewidth',1.2); ylabel('f1');
hold on; yline(f1,'--','Linewidth',1.2,'Color','r'); grid, hold off;
ylabel('$f_1$','Interpreter','Latex');
subplot(4,1,4);plot(seest(nburn:nstate), 'Linewidth',1.2); ylabel('s0');
hold on; yline(s0,'--','Linewidth',1.2,'Color','r'); grid, hold off;
ylabel('$\sigma_e$','Interpreter','Latex');
xlabel('$k$','Interpreter','Latex');