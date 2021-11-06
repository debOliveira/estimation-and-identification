%
% Demo file for Subspace identification
%
% Copyright: 
%          Peter Van Overschee, December 1995
%          peter.vanoverschee@esat.kuleuven.ac.be
%

%
%   Consider a multivariable fourth order system a,b,c,d
%   with two inputs and two outputs:

    a = 0.75;
    b = 0.3;
    c = 0.5;
    d = 0;
    m = 1; 				% Number of inputs
    l = 1; 				% Number of outputs

%   We take a white noise sequence of 1000 points as input u.
%   The simulated output is stored in y.

    onePeriod = [ones(1, 15), zeros(1, 30), ones(1, 15)];
    numCycles = 4;
    u = repmat(onePeriod, [1, numCycles])';
    N = length(u);
    t_u = linspace(0,N/2,N);
    y = dlsim(a,b,c,d,u);
    
%   We will now identify this system from the data u,y 
%   with the subspace identification algorithm: subid
%   
%   The only extra information we need is the "number of block rows" i
%   in the block Hankel matrices.  This number is easily determined
%   as follows:

%   Say we don't know the order, but think it is maximally equal to 10.
%   
%       max_order = 10;
%   
%   As described in the help of subid we can determine "i" as follows:
%   
%       i = 2*(max_order)/(number of outputs)
%       
        i = 2*(10)/m;
	   
%
%   The subspace algorithms is now easily started.
%   When prompted for the system order you should enter 4.
%   
    [A,B,C,D] = subid(y,u,i,1,[],'SV',1)

%   Did you notice the order was very easy to determine 
%   from the singular values?

%   Just to make sure we identified the original system again,
%   we will compare the original and estimated transfer function.
%   
    y_est = dlsim(A,B,C,D,u);
    
    if verbose    
        figure()
        subplot(211);
        plot(t_u,u(:,1), 'Linewidth', 1.2);  grid;
        title('Input');xlim([0,100]);
        xlabel('$k$','Interpreter','Latex'),
        ylabel('$u(k)$',...
        'Interpreter','Latex'),

        subplot(212);
        plot(t_u(1:2:end),y(1:2:end,1),'s','Linewidth', 1.2); hold on; 
        plot(t_u,y_est(:,1),'Linewidth', 1.2); hold off; grid;
        title('Output');xlim([0,100]);
        xlabel('$k$','Interpreter','Latex'),
        ylabel('$y(k),\hat{y}(k)$',...
        'Interpreter','Latex');
        legend('$y(k)$','$\hat{y}(k)$', ...
                'Interpreter','Latex',...
                'Location', "best");
    end
%   As you can see, the original and identified system are
%   exactly the same.
%   


