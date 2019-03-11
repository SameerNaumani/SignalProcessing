%Lab 3 Discrete Time Fourier Series
%Part A 
% A.1 Find fundamental period No and fundamental frequency Omega of x[n]
% N = 2 Omega = pi
clc
N_0 = 2;
n = (0 : N_0-1);
Om_0 = 2*pi/N_0;                                                        % fundamental frequency of x[n]
x = 4*cos(2.4*pi*n)+2*sin(3.2*pi*n);                                    % definition of x[n]
for r = 0: N_0-1,
    X_r(r+1) = sum(x.* exp(-j.*r.*n.*Om_0))/N_0;                        % computing the DFTS of x[n]
end

figure
subplot(2,1,1)
stem(real(X_r))
xlabel('r'); ylabel('|D_r|'); title('Magnitude Plot of A.2');
subplot(2,1,2)
stem(angle(X_r)) 
xlabel('r'); ylabel('\angleD_r');title('Phase Plot of A.2');

%% Problem 3
clc
N_0 = 6;                                                                % fundamental period of y[n]
n = (0 : N_0-1);                                                        % fundamental frequency of y[n]
Om_0 = 2*pi/N_0;

y = [3 2 1 0 1 2];                                                      % definition of y[n]

for r = 0:N_0-1,
    Y_r(r+1) = sum(y.*exp(-j*r*n*Om_0))./N_0;                           % computing the DFTS of y[n]
end

figure
subplot(2,1,1)
stem(real(Y_r))
xlabel('r'); ylabel('|D_r|'); title('Magnitude Plot of A.3');

subplot(2,1,2)
stem(angle(Y_r))
xlabel('r'); ylabel('\angleD_r');title('Phase Plot of A.3');


%% Part B Inverse DTFS
clc
N_2 = 32;
n = (0:N_2-1);
Omega_0 = (2.*pi)/N_2;
x = [ones(1,5) zeros(1,23) ones(1,4)];
for r = 0:N_2-1
    X_r(r+1) = sum(x.*exp(-j.*r.*Omega_0.*n))./N_2;
end
r=n;
%X_r = ifft(x)./N_1;
figure;
stem(r,real(X_r),'k.');
xlabel('r'); 
ylabel('X_r');
figure;
stem(r,imag(X_r));

%B.2
clc
N_2 = 32;
n = (0:N_2-1);
Omega_0 = (2.*pi)/N_2;
x = [ones(1,5) zeros(1,23) ones(1,4)];
Xs = x.*exp(-j.*5.*r.*Omega_0.*n);
for r = 0:N_2-1
    X_r(r+1) = sum(Xs.*exp(-j.*r.*Omega_0.*n))./N_2;
end
r=n;
%X_r = ifft(Xs)./N_1;
figure;
stem(r,real(X_r),'k.');
xlabel('r'); 
ylabel('X_r');
figure;
stem(r,imag(X_r));









