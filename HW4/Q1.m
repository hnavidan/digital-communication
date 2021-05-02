%% Mutual Information
%% ==================

e = 0.2; %Error Probability
p = 0:0.001:1; %Input is 1
q = 1-p; %Input is 0

Ixy = zeros(1,length(p));
for m = 1:length(p)
    Pxy = [q(m)*(1-e) , q(m)*e ; p(m)*e , p(m)*(1-e)]; %Values of P(XY)
    Px = [q(m) , p(m)]; %Values of P(X). Needs to be in a vector
    Py = [p(m)*e + q(m)*(1-e) , p(m)*(1-e) + q(m)*e]; %Values of P(Y)
    
    for i = 1:2
        for j = 1:2
            Ixy(m) = Ixy(m) + Pxy(i,j)*log2(Pxy(i,j)/(Px(i)*Py(j)));
        end
    end
end

figure;
plot(p, Ixy, 'LineWidth', 1.5);
xlabel('Probability of Inputs');
ylabel('Mutual Information');
title('Mutual Information in a BSC Channel')
grid;
