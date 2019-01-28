%Part A3 Linear transformation
t = (-10:0.1:70); %Continuous Signal
n = (-10:70); %Discrete Signal

figure;
u = @(t)1.0.*(t>=0); 
f = @(t)5.*exp(-t/8);
z = @(t)f(t).*(u(t)-u(t-10));
subplot(2,1,1);
stem(t,z(t));
grid;

%i y3(t) = z(t/3)
y3 = @(t)z(t/3); %Continuous
subplot(2,1,2);
stem(n,y3(n));
grid;

%y3n = @(n)y(n/3); %y3n Discrete
%subplot(2,2,3);
%stem(n,y3n(n));
%grid;

%ii
%Explain why
