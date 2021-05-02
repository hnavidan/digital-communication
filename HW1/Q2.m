%% Part 1
%% One time Approximation with 10 samples
%%=======================================
s1 = rand(1,10)*2;

m1 = (2-0)/2;
m2 = mean(s);

v1 =  var(s);
v2 = ((2-0)^2)/12;


%% Part 2
%% Ten time Approximation with 10 samples
%%=======================================
for i = 1:10
    s2 = rand(1,10)*2;
    m(i) = mean(s2);
end

figure;
plot(1:10, m);
MMean1 = sum(m)/10;

%% Part 3
%% One time Approximation with 1000 samples
%%=========================================
s3 = rand(1,1000)*2;

mean1 = (2-0)/2;
mean2 = mean(s3);

var1 =  var(s3);
var2 = ((2-0)^2)/12;

%% Part 4
%% Ten time Approximation with 1000 samples
%%=========================================
for i = 1:10
    s4 = rand(1,1000)*2;
    n(i) = mean(s4);
end

figure;
plot(1:10, n);
MMean2 = sum(n)/10;
