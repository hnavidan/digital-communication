%% AWGN Channel Capacity
%% 3D Approach. Surface Plot.
%% ==========================

W = 0:1:100;
[W, P_N0] = meshgrid(W);
C = W.*log2(1+(P_N0).*(1./W));
surf(W,P_N0,C)
xlabel('Bandwidth');
ylabel('P/_{N0} Ratio');
zlabel('Capacity');
title('AWGN Channel Capacity');
