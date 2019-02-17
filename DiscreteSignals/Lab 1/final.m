%% ELE 632 Lab #1 
% *Chaim Frischman (500626941)* &
% *Sameer Naumani (500703778)*
% 
% In Matlab, functions need to be declared at the bottom of the 
% script. Therefore, all function declarations can be found at the end of
% the report.
%%% Part A
%%
% Question 1
%%
% The range of n values are delta function are declared:
n = (-10:10);
h1= @(n)1.0*(n==0); %Delta function is only 1 at n = 0
%%
% Part A.1.I is plotted:
figure;
stem(n, h1(n-3));
title('A.1.I');
grid;
%%
% Part A.1.II is plotted:
u1= @(n)1.0*(n>=0); 
figure;
stem(n, u1(n+1));
title('A.1.II');
grid;
%%
% Part A.1.III is plotted:
x = @(n) cos(pi.*n./5).*u1(n);
figure;
stem(n,x(n));
title('A.1.III: x(n) = cos((pi*n)/5)u(n)');
grid;
%%
% Part A.1.IV is plotted:
x1 = @(n)x(n-3); 
figure;
stem(n,x1(n));
title('A.1.IV: x1(n) = x(n-3)');
grid;
%%
% Part A.1.V is plotted:
x2 = @(n)x(-n); 
figure;
stem(n,x2(n));
title('A.1.V: x2(n) = x(-n)');
grid;
%%
% In x1(n) the transformation that is performed is a time shift to the
% right by 3.
% In x2(n) the transformation that is performed is a time reversal noted by
% the x(-n).  
%%
% Question 2
%%
% Part A.2.I is plotted:
figure;
n = (-10:70);
u = @(n)1.0.*(n>=0); %Don't forget .* operation as opposed to just *
f = @(n)5.*exp(-n/8);
y = @(n)f(n).*(u(n)-u(n-10));
stem(n,y(n));
title('A.2.I');
grid;
%%
% Part A.2.II is plotted:
figure;
y1 = @(n)y(3.*n); %y1(n) = y(3n) Downsampling
stem(n,y1(n));
title('A.2.II');
grid;
%%
% Part A.2.III is plotted:
figure;
y2 = @(n)y(n./3); %y2(n) = y(n/3) Upsampling
stem(n,y2(n));
title('A.2.III');
grid;
%%
% The two transformations are examples of variations of timescaling. 
% y1(n) is scaling the function by 3. Hence, are sampling only the
% dividends of 3. As a result we are downsampling because we are sampling less
% points
% y2(n) is is scaling the function by 1/3. As a result we are upsampling as
% more points are sampled.
%%
% Question 3
%%
% Part A.3.I is plotted:
t = (-10:1:70);
figure; 
f = @(t)5.*exp(-t/8);
z = @(t)f(t).*(u(t)-u(t-10));
y3 = @(t)z(t./3);
stem(t,y3(t));
title('A.3.I');
grid;
%%
% y3(n) and y2(n) are different due to the fact that discrete functions can
% only operate on integer values while continuous functions are not
% exclusivlely limited to integer values. Continuous funcitons are able to
% operate and resolve real numbers as well.
%%
%%% Part B
% The interest rate and starting balance are hard coded
% global variables. This makes it easy to have these values changed,
% without touching and/or modifying any other parts of the code:
global BALANCE INTEREST_RATE;
%%
% The function "reset_global_variables()" resets the balance and interest
% rate back to their starting values to ensure Part 2 and Part 3 begin with
% the proper input values.
reset_global_variables();
%%
% Part 2:
figure;
title("Part B.2");
xlabel("Month of the Year");
ylabel("Dollars");
for month = 1:12
    hold on
    stem(month, calculate_balance(0));
    hold off
end
%%
% The balance after a year of no deposits is:
BALANCE
%%
% Global variables are reset and the balance is calculated when one
% deposits $100 * n each month, where n is the number month of the year.
reset_global_variables();

figure;
title("Part B.3");
xlabel("Month of the Year");
ylabel("Dollars");
for month = 1:12
    hold on
    stem(month, calculate_balance(100 * month));
    hold off;
end
%%
% The balance after a year of deposits of $100*n each month, where n is the
% number month of the year:
BALANCE
%%
%%% Part C
% Interval n (length 45), delta function and x(n) input signals are
% decalared:
n = (0:44);
d = @(n)1.0*(n==0); %Delta function
x = @(n) cos(pi.*n./5) + d(n-20) + d(n-35);

values_of_n = [4 8 12];
figure;

for index = 1:numel(values_of_n)
    subplot(length(values_of_n),1, index);
    stem(max_filter(x(n), values_of_n(index)));
    title(['Max Filter of x(n) with N = ', num2str(values_of_n(index))]);
    xlabel('n');
    ylabel('y');
end    
%%
%%% Part D
% Below, the functions for energy and power of a discrete signal are
% decalred. The input signal is also declared and the results of the energy
% and power of the input signal are displayed respectively.
INPUT_SIGNAL = [-9, -6, -3, 0, 3, 6, 9];
%%
% The energy of the input signal is:
energy = calculate_energy_of_signal(INPUT_SIGNAL);
energy
%%
% The power of the input signal is:
power = caluclate_power_of_signal(INPUT_SIGNAL);
power
%%
% Declaration of functions
%%
% Part B Functions:
function reset_global_variables()
    global BALANCE INTEREST_RATE
    BALANCE = 2000;
    INTEREST_RATE = 2;
end

function account_balance = calculate_balance(deposit)
    global BALANCE INTEREST_RATE;
    account_balance = ((1 + (INTEREST_RATE/100)) * BALANCE) + deposit;
    BALANCE = account_balance;
end
%%
% Part C Functions:
function max_vector = max_filter(x, N)
    M = length(x);
    y = zeros(1, length(x));
    x = [zeros(1,N-1) x];
    for i = 1:M
        y(i) = max(x(i:i+N-1));
    end
    max_vector = y;
end
%%
% Part D Functions:
function energy_of_signal = calculate_energy_of_signal(input_signal)
    energy_of_signal = 0;
    for signal = input_signal
        energy_of_signal = energy_of_signal + abs(signal.^2);
    end
end

function power_of_signal = caluclate_power_of_signal(input_signal)
    power_of_signal = calculate_energy_of_signal(input_signal) / length(input_signal);
end

