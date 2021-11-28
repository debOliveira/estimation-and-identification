figure()
subplot(4,1,1); histogram(b1est(nburn:nstate)/b1,50); grid;
ylabel('$b_1$','Interpreter','Latex');
subplot(4,1,2); histogram(b2est(nburn:nstate)/b2,50); grid;
ylabel('$b_2$','Interpreter','Latex');
subplot(4,1,3); histogram(f1est(nburn:nstate)/f1,50);  grid;
ylabel('$f_1$','Interpreter','Latex');
subplot(4,1,4); histogram(seest(nburn:nstate)/s0,50);  grid;
ylabel('$\sigma_e$','Interpreter','Latex');