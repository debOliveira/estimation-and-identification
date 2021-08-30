a = [1 0.7 0.5 -0.3];
b = [1 0.3 0.2 0.1];
n = length(a);
I = 0;

hist_a = zeros(n); hist_b = zeros(n);
hist_a(1,:) = a; hist_b(1,:) = b;

for j = 1:(n-1)
    a_next = a; b_next = b;
    %
    k = n - j;
    alpha = a(k+1)/a(1);
    beta = b(k+1)/a(1);
    %
    for i = 1:k
        a_next(i) = a(i)-alpha*a(k-i+2);
        b_next(i) = b(i)-beta*a(k-i+2);
    end   
    %
    a = a_next; b = b_next;
    a(k+1) = 0; b(k+1) = 0;
    %
    hist_a(j+1,:) = a; hist_b(j+1,:) = b;
end

for j = 1:n
    k = n-j+1;
    I = I + hist_b(k,j)^2/hist_a(k,1);
end

I = I/hist_a(1,1)