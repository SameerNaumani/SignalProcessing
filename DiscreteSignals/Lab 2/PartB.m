n = (0:30);

a = [1,-3/10,-1/20];
b = [2,0,0];
delta = @(n)1.0.*(n==0);
h = filter (b,a,delta(n));
Y = [1,2];              %Initial Conditions
z_i = filtic(b, a, Y);  %Finding Initial Conditions
y_0 = filter(b, a, zeros(size(n)),z_i); %Zero Input response
figure;
stem(n, y_0, 'k');

%C
%x = 2cos(2pin/6)(u(n)-u(n-10)
u1= @(n)1.0.*(n>=0); %Unit Step is only 1 when n>=0
x = @(n)2.*cos(2.*pi.*n./6).*(u1(n)-u1(n-10));
y_1 = filter(b,a,x(n));
figure;
stem(n, y_1, 'g');

%D
y_total = filter(b,a,x(n),z_i);
figure;
stem(n, y_total);

%D.2
y_total2 = y_0 + y_1 ;
figure;
stem(n, y_total2);


