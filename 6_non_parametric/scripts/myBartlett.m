% plot G_dhat/True TF
i_first = find(w>0.02, 1, 'first');
i_last = find(w>2, 1, 'first');
figure("position",[100 100 600 400]); subplot(2,2,1);
loglog(w(i_first:i_last),G_dhat(i_first:i_last),...
    'LineWidth',1.0,"Color",lineStyles(1,:)); hold on;
i_first_H_w = find(H_w>0.02, 1, 'first');
i_last_H_w = find(H_w>2, 1, 'first');
loglog(H_w(i_first_H_w:i_last_H_w), H_mag(i_first_H_w:i_last_H_w),...
    'LineWidth',1.8,"Color",lineStyles(2,:));
ylim([1e-1 1e2]), xlim([1e-2 1e1]), hold off;
xlabel('$\omega$','Interpreter','Latex'),
ylabel('$\hat{\hat{G}},G_0(\omega)$',...
    'Interpreter','Latex'),
legend('$ETFE$','$|G_0(\omega)|$',...
        'Interpreter','Latex',...
        'Location', "best"); grid;
%% Bartlett windowing
G_hat = zeros(1,N); G_hat_Phi = zeros(1,N); 

% Compute integral
for j = 1:size(gamma_vec,2)
    gamma = gamma_vec(j);
    for i = 1:N
        window = myWin(gamma, epsilon-w(i),2);
        % for 6.46
        Phy_yu = sum(window.*U2.*Y./U);
        Phy_uu = sum(window.*U2);
        G_hat(i) = Phy_yu/Phy_uu;
        % for 6.51
        Phy_yu = sum(window.*Phi_u.*Y./U);
        Phy_uu = sum(window.*Phi_u);
        G_hat_Phi(i) = Phy_yu/Phy_uu;
    end
    subplot(2,2,j+1);
    K = abs(G_hat);
    loglog(w(i_first:10:i_last),K(i_first:10:i_last),...
        's','LineWidth',1.0,"Color",lineStyles(3,:)); hold on;
    K = abs(G_hat_Phi);
    loglog(w(i_first:i_last),K(i_first:i_last),...
        'LineWidth',1.4,"Color",lineStyles(1,:));
    loglog(H_w(i_first_H_w:i_last_H_w), H_mag(i_first_H_w:i_last_H_w),...
        'LineWidth',1.8,"Color",lineStyles(2,:));
    ylim([1e-1 1e2]), xlim([1e-2 1e1]), hold off;
    xlabel('$\omega$','Interpreter','Latex'),
    ylabel('$\hat{G},G_0(\omega)$',...
    'Interpreter','Latex'),
    legend("$|\hat{G}(w)|_\Phi,\gamma = $"+num2str(gamma),...
        "$|\hat{G}(w)|,\gamma = $"+num2str(gamma),...
        '$|G_0(\omega)|$',...
        'Interpreter','Latex',...
        'Location', "best"); grid;
end