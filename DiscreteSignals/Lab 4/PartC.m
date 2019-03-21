%% Part C
clc
N = 35;
Omega = linspace(0,2*pi*(1-1/N),N);
H_d = @(Omega)(mod(Omega,2*pi)>(2*pi)/3) + (mod(Omega,2*pi)<2*pi-(2*pi/3));                                                                % fundamental period of x[n]
H = H_d(Omega);
h = real(ifft(H));
H = freqz(h,1,0:2*pi/1001:2*pi);

figure;
subplot(2,1,1)
stem(h)
subplot(2,1,2)
plot(abs(H))

clc
N = 71;
Omega = linspace(0,2*pi*(1-1/N),N);
H_d = @(Omega)(mod(Omega,2*pi)>(2*pi)/3) + (mod(Omega,2*pi)<2*pi-(2*pi/3));                                                                % fundamental period of x[n]
H = 1.0 * H_d(Omega);
h = real(ifft(H));
H = freqz(h,1,0:2*pi/1001:2*pi);

figure;
subplot(2,1,1)
stem(h)
subplot(2,1,2)
plot(abs(H))


