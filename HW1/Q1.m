%% Part 1
%% Create Random Number in range of [0, a]
%%========================================
a = input('Enter positive value for a : ');
while (a < 0)
    disp('Invalid Value!');
    a = input('Enter positive value for a : ');
end

num1 = rand()*a;
disp('Generated number is : ');
disp(num1);

%% Part 2
%% Create Random Number in range of [b, c]
%%========================================
b = input('Enter positive value for b : ');
c = input('Enter positive value for c : ');
while (b < 0 || c < 0 || b > c)
    disp('Invalid Value!');
    b = input('Enter positive value for b : ');
    c = input('Enter positive value for c : ');
end

num2 = rand()*(c-b) + b;
disp('Generated number is : ');
disp(num2);

%% Part 3
%% Create Bernoulli distribution
%%==============================
p = input('Enter positive value for p : ');
while (p > 1 || p < 0)
    disp('Invalid Value!');
    p = input('Enter positive value for p : ');
end

num = rand();

if (num > p)
    x = 0;
elseif (num <p)
    x = 1;
end
