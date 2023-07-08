function [w,X] = myFFT(x,N)
    w = linspace(0,2*pi,N);
    t = 1:N;
    X = zeros(1,N); 
    for i = 1:N
        X(i) = sum(x.*exp(-1j*w(i)*t));
    end
    X = abs(X)./sqrt(N);
end