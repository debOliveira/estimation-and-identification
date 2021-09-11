function window = myWin(gamma, w, type)
    switch type
        case 1 %Barllet
            aux = sin(gamma.*w/2)./sin(w/2);
            window = 1/(2*pi)./gamma.*aux.^2;
        case 2 %Parzen
            aux = sin(gamma.*w/4)./sin(w/2);
            window = 4/(2*pi)./(gamma.^3).*(2+cos(w)).*aux.^4;
        otherwise %Hamming
            D1 = myD(gamma,w);
            D2 = myD(gamma,w-pi/gamma);
            D3 = myD(gamma,w+pi/gamma);
            window = 1/(2*pi)*(0.5.*D1+0.25.*D2+0.25.*D3);
    end
end

