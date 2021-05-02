%% Discrte-Time AWGN Channel Capacity
%% 2D Approach. Values are given by user.
%% ======================================

while 1
    M = input(' 1- Plot C against P \n 2- Plot C against PN \n Enter Mode: ');

    if (M == 1)
        PN = input ('Enter PN value: ');
        Pmax = input ('Enter range of P ([0, Pmax]): ');
        P = 0:1:Pmax;
        C = zeros(1, length(P));
        for i = 1:1:length(P)
            C(i) = 0.5*log2(1+(P(i)/PN));
        end

        figure;
        plot(P, C, 'LineWidth', 1.5);
        xlabel('Input Power');
        ylabel('Capacity');
        title('Discrete AWGN Channel Capacity');
        grid;
        break;
    elseif (M == 2)
        P = input ('Enter P value: ');
        PNmax = input ('Enter range of PN ([0, PNmax]): ');
        PN = 0:1:PNmax;
        C = zeros(1, length(PN));
        for i = 1:1:length(PN)
            C(i) = 0.5*log2(1+(P/PN(i)));
        end

        figure;
        plot(P_N0, C, 'LineWidth', 1.5);
        xlabel('Noise Power');
        ylabel('Capacity');
        title('Discrete AWGN Channel Capacity');
        grid;
        break;
    end
end