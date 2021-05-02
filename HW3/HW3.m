%% Bit Sequence Generation
%% =======================
n = 10^6; % Number of Bits
InSeq = randi([0,1], 1, n);
Sm = 2*InSeq - 1; %BPSK Modulation (0 => -1 , 1 => 1)

%% Adding WGN and Detection
%% =======================
NP = 0:8; %SNR Value, desired is from 0 to 8 dB. NP = NoisePow

for i = 1:length(NP)
    %Initial Values for each loop
    R = zeros(1,n);
    OutSeq = zeros (1,n); 

    Noise = wgn(1,n, -NP(i), 'complex'); %White Gaussian Noise, must be complex
    R = Sm + Noise; %Adding Noise to BPSK
    OutSeq = real(R)>0; %If real part of R > 0, output is 1 otherwise 0

    %Calculating Bit Error, NCB is number of corrupt bits
    [NCB(i), BER(i)] = biterr(InSeq, OutSeq); 
end

%% Calculating Theory BER
%% ======================
TheoryBER = 0.5*erfc(sqrt(10.^(NP/10))); % theoretical ber

%% Plotting
%% =========
figure;
semilogy(NP, BER, 'rx-');
hold on;
semilogy(NP, TheoryBER, 'b.-');
axis([0 8 10^-4 1]);
grid;
legend('Simulation BER','Theory BER');
title('Bit Error Rate of a BPSK Modulation with AWGN');
xlabel('Eb/N0 (dB)');
ylabel('Bit Error Rate');