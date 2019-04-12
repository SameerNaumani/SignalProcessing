%% Lab5 PartA
%1
clc;
N = 10;
n = (0 : N-1);
x1 = exp(1i*2*pi*n*30/100) + exp(1i*2*pi*n*33/100);
x2 = cos(2*pi*n*30/100) + 0.5*cos(2*pi*n*40/100);
fr = n/N;
X1 = fft(x1);
X2 = fft(x2);

figure;
subplot(2,1,1)
stem(fr,abs(X1))
subplot(2,1,2)
stem(fr, abs(X2))

%i
% x2 has a symmetric spectrum because it is periodic and centered at 0.5
%ii 
% it is not possible to see the frequency components in x1 because the
% exponentials are non periodi. In x2 you are able to see it because it is
% periodic.
% iii 
% There are other frequency components because it is aperiodic



%2
clc;
N = 500;
n = (0 : N-1);
x1 = exp(j*2*pi*n*30/100) + exp(j*2*pi*n*33/100);
x2 = cos(2*pi*n*30/100) + 0.5*cos(2*pi*n*40/100);

x_1 = [x1,zeros(1,490)];
X_1 = fft(x_1);
x_2 = [x2,zeros(1,490)];
X_2 = fft(x_2);

figure;
subplot(2,1,1);
stem(fft(abs(X_1)));
subplot(2,1,2);
stem(fft(abs(X_2)));

% There is an improvement as you see the shape more clearly.

%3
clc;
N = 100;
n = (0 : N-1);
x1 = exp(1i*2*pi*n*30/100) + exp(1i*2*pi*n*33/100);
x2 = cos(2*pi*n*30/100) + 0.5*cos(2*pi*n*40/100);
fr = n/N;
X1 = fft(x1);
X2 = fft(x2);

figure;
subplot(2,1,1)
stem(fr,abs(X1))
subplot(2,1,2)
stem(fr, abs(X2))

%They both seem to be symmetric because they are periodic with the
%addition of the extra zeros. Now one of the zeros acts as the center
%frequency. There are more samples.


%4
N = 500;
n = (0 : N-1);
x1 = exp(j*2*pi*n*30/100) + exp(j*2*pi*n*33/100);
x2 = cos(2*pi*n*30/100) + 0.5*cos(2*pi*n*40/100);

x_1 = [x1,zeros(1,400)];
X_1 = fft(x_1);
x_2 = [x2,zeros(1,400)];
X_2 = fft(x_2);

figure;
subplot(2,1,1);
stem(fft(abs(X_1)));
subplot(2,1,2);
stem(fft(abs(X_2)));

%There is an improvement because the general shape of the signal is more
%visible.







