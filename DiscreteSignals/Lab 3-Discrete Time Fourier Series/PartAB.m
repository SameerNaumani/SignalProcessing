%Lab 3 Discrete Time Fourier Series
%Part A 
% A.1 Find fundamental period No and fundamental frequency Omega of x[n]
% N = 2 Omega = pi
N_0 = 2;
n = (0:N_0-1);
Omega_0 = (2.*pi)/N_0;
x = @(n)(4.*cos(2.4.*pi.*n) + 2.*sin(3.2.*pi.*n));
for r = 0:N_0-1
    X_r(r+1) = sum(x(n).*exp(-j.*r.*Omega_0.*n))./N_0;
end
r=n;
X_r = fft(x(n))./N_0;
stem(r,real(X_r),'k.');
xlabel('r'); 
ylabel('X_r');
figure
stem(r,imag(X_r));

%A.3
N_1 = 6;
n = (0:N_1-1);
Omega_0 = (2.*pi)/N_1;
x = [3,2,1,0,1,2];
for r = 0:N_1-1
    X_r(r+1) = sum(x.*exp(-j.*r.*Omega_0.*n))./N_1;
end
r=n;
X_r = fft(x)./N_1;
figure;
stem(r,real(X_r),'k.');
xlabel('r'); 
ylabel('X_r');
figure;
stem(r,imag(X_r));


%% Part B Inverse DTFS
N_2 = 32;
n = (0:N_2-1);
Omega_0 = (2.*pi)/N_2;
x = [ones(1,5) zeros(1,23) ones(1,4)];
for r = 0:N_2-1
    X_r(r+1) = sum(x.*exp(-j.*r.*Omega_0.*n))./N_2;
end
r=n;
X_r = ifft(x)./N_1;
figure;
stem(r,real(X_r),'k.');
xlabel('r'); 
ylabel('X_r');
figure;
stem(r,imag(X_r));

%B.2
N_2 = 32;
n = (0:N_2-1);
Omega_0 = (2.*pi)/N_2;
x = [ones(1,5) zeros(1,23) ones(1,4)];
for r = 0:N_2-1
    X_r(r+1) = sum(x.*exp(-j.*r.*Omega_0.*n))./N_2;
end
r=n;
X = x.*exp(-j.*5.*r.*Omega_0.*n);
X_r = ifft(X)./N_1;
figure;
stem(r,real(X),'k.');
xlabel('r'); 
ylabel('X_r');
figure;
stem(r,imag(X_r));









