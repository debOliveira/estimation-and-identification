%% Cadeia de Markov
%
b1min=b1*0.8;
b1max=b1*1.3;
b2min=b2*0.8;
b2max=b2*1.3;
f1min=f1*0.8;
f1max=f1*1.3;
semin=s0*0.8;
semax=s0*1.3;
%
b1old=(b1min+b1max)/2;
b2old=(b2min+b2max)/2;
f1old=(f1min+f1max)/2;
seold=(semin+semax)/2;
%
modelold=idpoly([],[0  b1old b2old],[],[],[1 f1old]); 
modelPEM = modelold;
yest=sim(modelold,u);
%% Initial posterior = likelihood in this case, since the priors are uniform
%% log (-prior)
likeold=(0.5/s0^2)*(yest-ymed)'*(yest-ymed);
postold=likeold;
%% Metropolis-Hastings
nstate=100000;
nburn=0.015*nstate;
%
wb1=[1e-3,1e-3/2,1e-3/4];
wb2=[1e-3,1e-3/2,1e-3/4];
wf1=[5.2e-4,5.2e-4/2,5.2e-4/4];
wse=[5e-3,5e-3/2,5e-3/4];
drop = 1;
%
cont=1;
conta = zeros(nstate,1)';
b1est = zeros(nstate,1)';
b2est = zeros(nstate,1)';
f1est = zeros(nstate,1)';
seest = zeros(nstate,1)';
%
conta(1)=cont;
b1est(1)=b1old;
b2est(1)=b2old;
f1est(1)=f1old;
seest(1)=seold;
for nst=2:nstate
    % Generating candidates with an gaussian random walk proposal
    if nst == nstate*0.025
        drop = 2;
    elseif nst == nstate*0.05
        drop = 3;
    end
    b1new=b1old+randn*wb1(drop);
    b2new=b2old+randn*wb2(drop);
    f1new=f1old+randn*wf1(drop);
    senew=seold+randn*wse(drop);
    %% Checking limits
    if (b1new>0) && (b2new>0) && (f1new>-1) && (f1new<1) && (senew>0)
        modelnew=idpoly([],[0  b1new b2new],[],[],[1 f1new]);
        yest=sim(modelnew,u);
        %% New posterior=likelihood in this case, since the priors are uniform
        likenew=(0.5/s0^2)*(yest-ymed)'*(yest-ymed);
        postnew=likenew;
        %% Metropolis-Hastings acceptance test
        if log(rand) < (-postnew+postold)
            likeold=likenew;
            postold=postnew;
            b1old=b1new;
            b2old=b2new;
            f1old=f1new;
            seold=senew;
            cont=cont+1;
        end
        if mod(cont,nstate/10)==0
            fprintf("Iteration %d of %d...\n", cont, nstate);
        end
    end
    conta(nst)=cont;
    b1est(nst)=b1old;
    b2est(nst)=b2old;
    f1est(nst)=f1old;
    seest(nst)=seold;
end
%% Results
clc
fprintf("Real values \n > [b1 b2 f1 s0] = [%.2f %.2f %.2f %.2f]\n",...
    b1, b2, f1, s0);
%
fprintf("MCMC estimated \n > [b1 b2 f1 s0] = [%.2f %.2f %.2f %.2f]\n",...
    mean(b1est(nburn:nstate)), mean(b2est(nburn:nstate)),...
    mean(f1est(nburn:nstate)), mean(seest(nburn:nstate)));
fprintf(" > dev([b1 b2 f1 s0]) = [%.2f %.2f %.2f %.2f]\n",...
    std(b1est(nburn:nstate)), std(b2est(nburn:nstate)),...
    std(f1est(nburn:nstate)), std(seest(nburn:nstate)));
fprintf("Acceptance rate: %.2f\n", cont/nstate*100)
% % 
% figure()
% subplot(4,1,1);plot(b1est(nburn:nstate), 'Linewidth',1.2); ylabel('b1');
% hold on; yline(b1,'--','Linewidth',1.2,'Color','r'); grid, hold off;
% subplot(4,1,2);plot(b2est(nburn:nstate), 'Linewidth',1.2); ylabel('b2');
% hold on; yline(b2,'--','Linewidth',1.2,'Color','r'); grid, hold off;
% subplot(4,1,3);plot(f1est(nburn:nstate), 'Linewidth',1.2); ylabel('f1');
% hold on; yline(f1,'--','Linewidth',1.2,'Color','r'); grid, hold off;
% subplot(4,1,4);plot(seest(nburn:nstate), 'Linewidth',1.2); ylabel('s0');
% hold on; yline(s0,'--','Linewidth',1.2,'Color','r'); grid, hold off;
% %
% figure()
% subplot(4,1,1); histogram(b1est(nburn:nstate)/b1,50); ylabel('b1');
% subplot(4,1,2); histogram(b2est(nburn:nstate)/b2,50); ylabel('b2');
% subplot(4,1,3); histogram(f1est(nburn:nstate)/f1,50); ylabel('f1');
% subplot(4,1,4); histogram(seest(nburn:nstate)/s0,50); ylabel('s0');