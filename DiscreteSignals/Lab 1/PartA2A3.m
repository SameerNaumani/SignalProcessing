%Part A2 Scaling on a discrete time signal
%i
n = (-10:70);

figure;
u = @(n)1.0.*(n>=0); %Don't forget .* operation as opposed to just *
f = @(n)5.*exp(-n/8);
y = @(n)f(n).*(u(n)-u(n-10));
subplot(2,2,1);
stem(n,y(n));
grid;

%ii
y1 = @(n)y(3.*n); %y1(n) = y(3n) Downsampling
subplot(2,2,2);
stem(n,y1(n));
grid;

%iii
y2 = @(n)y(n./3); %y2(n) = y(n/3) Upsampling
subplot(2,2,3);
stem(n,y2(n));
grid;

%Explain effect of transformation on y1(n) and y2(n)
% The two transformations are examples of variations of timescaling. 
%y1(n) is scaling the function by 3. Hence, are sampling only the
%dividends of 3. As a result we are downsampling because we are sampling less
%points
%y2(n) is is scaling the function by 1/3. As a result we are upsampling as
%more points are sampled.

%Part A3 Linear transformation
t = (-10:1:70); %Continuous Signal

figure;
u1 = @(n)1.0.*(n>=0); 
f = @(t)5.*exp(-t/8);
z = @(t)f(t).*(u1(t)-u1(t-10));
subplot(2,2,1);
stem(t,z(t));
grid;

%i y3(t) = z(t/3)
y3 = @(t)z(t./3); %Continuous
subplot(2,2,2);
stem(t,y3(t));
subplot(2,2,3);
stem(n,y3(n));

grid;

%y3n = @(n)y(n/3); %y3n Discrete
subplot(2,2,3);
stem(n,y3n(n));
grid;

%ii
%Explain why y2(n) and y3(n) are not the same



