%% Discrete-Time AWGN Channel Capacity
%% 3D Approach. Surface Plot.
%% ===================================

P = 0:1:100;
[P, Pn] = meshgrid(P);
C = 0.5*log2(1+P./Pn);
surf(P,Pn,C)
xlabel('Input Power');
ylabel('Noise Power');
zlabel('Capacity');
title('Discrete AWGN Channel Capacity');
