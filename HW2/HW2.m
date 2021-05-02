%% Part 1
%% Create Bernoulli distribution
%%==============================
p = 0.7;

for i = 1:1:100
    num(i) = rand();

    if (num(i) > p)
        x(i) = 0;
    else
        x(i) = 1;
    end
end

%% Global Parameters
%%==================
Rb = 5; %Bitrate
Vp = 5; %Amplitiude
L = length(x); %100
T = L/Rb; %Length of Samples
Fs = 10*Rb; %Sample Frequency
dt = 1/(Rb*Fs); %Time Step
t = 0:dt:T;
M = length(t);
%% Part 2
%% Create On-Off Line Code
%%========================
Unipolar = zeros(1,M);

for i = 1:L
  if x(i) == 1
    Unipolar((i-1)*Fs+1:(i-0.5)*Fs) = 1*Vp;
    Unipolar((i-0.5)*Fs+1:i*Fs) = 0;
  else
    Unipolar((i-1)*Fs+1:i*Fs) = 0;
  end
end

figure;
plot(t,Unipolar,'LineWidth',2);
title('Unipolar (On-Off)');
ylim([-2,6]); grid;


%% Part 3
%% Create Polar Line Code
%%=======================

Polar = zeros(1,M); 
for i = 1:L
  if x(i) == 1
    Polar((i-1)*Fs+1:(i-0.5)*Fs) = 1*Vp;
    Polar((i-0.5)*Fs+1:i*Fs) = 0;
  else
    Polar((i-1)*Fs+1:(i-0.5)*Fs) = -1*Vp;
    Polar((i-0.5)*Fs+1:i*Fs) = 0;
  end
end

figure;
plot(t,Polar,'LineWidth',2);
title('Polar');
ylim([-6,6]); grid;

%% Part 4
%% Create Bipolar Line Code
%%============================
Bipolar = zeros(1,M); 
for i = 1:L
  if x(i) == 1 
      if (rem(i,2) == 0) % If even
        Bipolar((i-1)*Fs+1:(i-0.5)*Fs) = -1*Vp;
        Bipolar((i-0.5)*Fs+1:i*Fs) = 0;
      else % If odd
        Bipolar((i-1)*Fs+1:(i-0.5)*Fs) = 1*Vp;
        Bipolar((i-0.5)*Fs+1:i*Fs) = 0;
      end
  else
    Bipolar((i-1)*Fs+1:i*Fs) = 0;
  end
end
figure;
plot(t,Bipolar,'LineWidth',2);
title('Bipolar');
ylim([-6,6]); grid;


%% Part 5
%% Create Manchester Line Code
%%============================
Manchester = zeros(1,M);
for i = 1:L
  if x(i) == 1
    Manchester((i-1)*Fs+1:(i-0.5)*Fs) = 1*Vp;
    Manchester((i-0.5)*Fs+1:i*Fs) = -1*Vp;
  else
    Manchester((i-1)*Fs+1:(i-0.5)*Fs) = -1*Vp;
    Manchester((i-0.5)*Fs+1:i*Fs) = 1*Vp;
  end
end
figure;
plot(t,Manchester,'LineWidth',2);
title('Manchester');
ylim([-6,6]); grid;


%% Spectrum
%%=========
WelchEstimator = spectrum.welch;

UnipolarPSD = psd(WelchEstimator,Unipolar,'Fs',Fs);
PolarPSD = psd(WelchEstimator,Polar,'Fs',Fs);
BipolarPSD = psd(WelchEstimator,Bipolar,'Fs',Fs);
ManchesterPSD = psd(WelchEstimator,Manchester,'Fs',Fs);

figure; 
grid;
hold on;
p1 = plot(UnipolarPSD);
p2 = plot(PolarPSD); 
p3 = plot(BipolarPSD); 
p4 = plot(ManchesterPSD);

set(p1,'LineWidth', 2.5,'Color','r');
set(p2,'LineWidth', 2.5,'Color','b');
set(p3,'LineWidth', 2.5,'Color','g'); 
set(p4,'LineWidth', 2.5,'Color','k'); 
legend('Unipolar','Polar','Bipolar','Manchester');
