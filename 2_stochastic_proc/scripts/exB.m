%% Initial configuration
lineStyles = linspecer(4);
rng(1) % For reproducibility
close all
%% Specifications
N = 200;
nBins = 5;
%% Model 1
e = normrnd(0,1,[1 N]);
v = zeros(1,N);  
%
for k=2:N
    v(k) = e(k) - (-0.9)*v(k-1);
end
%
figure(1),subplot(2,2,1);
plot(v), grid; xlim([0 200]);
title('Model 1');
figure(2),subplot(2,2,1); 
% histogram(v,nBins, ...
%          'normalization', 'probability');
[c,lags] = xcov(v,v,20,'normalized');
plot(lags,c), grid;
title('Model 1');
%% Model 2
v = zeros(1,N);  
%
for k=2:N
    v(k) = e(k) - 0.9*v(k-1);
end
%
figure(1),subplot(2,2,2);
plot(v), grid; xlim([0 200]);
title('Model 2');
figure(2),subplot(2,2,2); 
% histogram(v,nBins, ...
%          'normalization', 'probability');
[c,lags] = xcov(v,v,20,'normalized');
plot(lags,c), grid;
title('Model 2');
%% Model 3
v = zeros(1,N);  
%
for k=3:N
    v(k) = e(k) + 0.5*e(k-1) - (-0.5)*v(k-1) - (0.7)*v(k-2);
end
%
figure(1),subplot(2,2,3);
plot(v), grid; xlim([0 200]);
title('Model 3');
figure(2),subplot(2,2,3); 
% histogram(v,nBins, ...
%          'normalization', 'probability');
[c,lags] = xcorr(v,v,20,'normalized');
plot(lags,c), grid;
title('Model 3');
%% Model 4
rng(1) 
e = rand(N,1);
v = zeros(1,N);  
%
p1 = 0.01; p2 = 0.01;
v1=sqrt(50); v2=-sqrt(50);
%
v(e <= p1 )= v1;
v((e > p1)&(e <= (p1+p2))) = v2;
%
figure(1),subplot(2,2,4);
plot(v); xlim([0 200]), grid;
title('Model 4');
sgtitle('Realizations') 
%
figure(2),subplot(2,2,4); 
% histogram(v,nBins, ...
%          'normalization', 'probability');
[c,lags] = xcov(v,v,20,'normalized');
plot(lags,c), grid;
sgtitle('Covariance functions') 
title('Model 4');