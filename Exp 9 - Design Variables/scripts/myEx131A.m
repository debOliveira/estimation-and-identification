rng('default') % For reproducibility
lineStyles = linspecer(4);
% generating signals
N = 1000;
gauss = normrnd(0,1,[1 N]);
[b,a] = butter(5,[1 2]/pi,"bandpass");
e = filter(b,a,gauss);
rbs = -ones(size(e))+2*(e>0);
% Plot
figure(), subplot(2,1,1)
stairs(e, "LineWidth", 1.2, "Color", lineStyles(1,:)), 
xlabel('$t$','Interpreter','Latex'),
ylabel('$e(t)$','Interpreter','Latex'), grid on, xlim([0 100])
subplot(2,1,2), 
stairs(rbs,"LineWidth", 1.2, "Color",lineStyles(2,:)), 
ylim([-1.2,1.2]),
xlabel('$t$','Interpreter','Latex'),
ylabel('$RBS(t)$','Interpreter','Latex'), grid on, xlim([0 100])
