%% AWGN Channel Capacity
%% 2D Approach. Values are given by user.
%% ======================================

while 1
    M = input(' 1- Plot C against W \n 2- Plot C against P/N0 \n Enter Mode: ');

    if (M == 1)
        P_N0 = input ('Enter P/N0 value: ');
        Wmax = input ('Enter range of W ([0, Wmax]) : ');
        W = 0:1:Wmax;
        C = zeros(1, length(W));
        for i = 1:1:length(W)
            C(i) = W(i)*log2(1+(P_N0.*(1/W(i))));
        end

        figure;
        plot(W, C, 'LineWidth', 1.5);
        xlabel('Bandwidth');
        ylabel('Capacity');
        title('AWGN Channel Capacity');
        grid;
        break;
    elseif (M == 2)
        W = input ('Enter W value: ');
        P_N0max = input ('Enter range of P/N0 ([0, (P/N0)max]) : ');
        P_N0 = 0:1:P_N0max;
        C = zeros(1, length(P_N0));
        for i = 1:1:length(P_N0)
            C(i) = W*log2(1+(P_N0(i).*(1/W)));
        end

        figure;
        plot(P_N0, C, 'LineWidth', 1.5);
        xlabel('P/N0');
        ylabel('Capacity');
        title('AWGN Channel Capacity');
        grid;
        break;
    end
end