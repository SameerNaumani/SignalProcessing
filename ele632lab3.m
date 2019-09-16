% Lab 3: Discrete Time Fourier Series
% Part A
%% Problem 2
clc
N_0 = 5;                                                                % fundamental period of x[n]
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

% Part B
%% Problem 1
clc
X_r = [ones(1,5) zeros(1,23) ones(1,4)];                                % definition of X_r

N_0 = 32;                                                               % fundamental period of x[n]
Om_0 = 2*pi/N_0;                                                        % fundamental frequency of x[n]

x = real(ifft(X_r)*N_0);                                                % compute the inverse DFTS of X_r
n = (0 : N_0-1);
figure
plot(n,x)
xlabel('n'); ylabel('x[n]'); title('Plot of B.1');

%% Problem 2
clc
X_r = [ones(1,5) zeros(1,23) ones(1,4)];                                % definition of X_r
n = (0 : N_0-1);
N_0 = 32;                                                               % fundamental period of x[n]
Om_0 = 2*pi/N_0;                                                        % fundamental frequency of x[n]
X_r = X_r .* exp(-j.*5.*Om_0*n);                                        % X_r is multipled by exp(-j*5*O*n)

x = real(ifft(X_r)*N_0);                                                % compute the inverse DFTS of X_r

figure
plot(n,x)
xlabel('n'); ylabel('x[n]'); title('Plot of B.2');

% Part C
%% Problem 1
clc
M = 9;
N_0 = 32;                                                                % fundamental period of x[n]
Om_0 = 2*pi/N_0;                                                         % fundamental frequency of x[n]
H_r = [ones(1,(M+1)/2) zeros(1,N_0-M) ones(1,(M-1)/2)];                  % definition of H_r
r = 0: N_0-1;

figure
stem(Om_0*r, H_r)
xlabel('\Omega'); ylabel('|H(\Omega)|'); title('Plot of C.1');

%% Problem 2
clc
M = 9;
N_0 = 32;                                                                % fundamental period of x[n]
Om_0 = 2*pi/N_0;                                                         % fundamental frequency of x[n]
H_r = [ones(1,(M+1)/2) zeros(1,N_0-M) ones(1,(M-1)/2)];                  % definition of H_r
%H_r = [ones(1,5) zeros(1,13)]

n = 0: N_0-1;
x1 = 4*cos(pi*n/8);                                                      % definition of x1[n]
X1_r = fft(x1)./N_0;                                                     % compute the DFTS of x1[n]

Y1_r = X1_r.* H_r;                                                       % compute the response of the system to x1[n] IN 
y1 = real(ifft(Y1_r)*N_0);                                               % find the inverse DFTS of Y1_r

figure
stem(n,y1)
xlabel('n'); ylabel('y_1[n]'); title('Plot of C.2');

%% Problem 3
clc
M = 9;
N_0 = 32;                                                                % fundamental period of x[n]
Om_0 = 2*pi/N_0;                                                         % fundamental frequency of x[n]
H_r = [ones(1,(M+1)/2) zeros(1,N_0-M) ones(1,(M-1)/2)];                  % definition of H_r
n = 0: N_0-1;
x2 = 4*cos(pi*n/2);                                                      % definition of x2[n]
X2_r = fft(x2)./N_0;                                                     % compute the DFTS of x2[n]

Y2_r = X2_r.* H_r;                                                       % compute the response of the system to x2[n] IN 
y2 = real(ifft(Y2_r)*N_0);                                               % find the inverse DFTS of Y2_r

figure
stem(n,y2)
xlabel('n'); ylabel('y_2[n]'); title('Plot of C.3');

%% Problem 4
% the plots of C.1 and C.2 are different because of the difference in their fundamental periods