%%
% A.1
b1 = [1/3 0 0]; 
a1 = [1 1/6 -1/6];
n = (0:30); 
delta = inline('n==0','n');
h1 = filter(b1,a1,delta(n));
figure
stem(n,h1,'k'); 
axis([-.5 30.5 -1.1 1.1]);
xlabel ('n'); 
ylabel('h1[n]');
title('h1[n]');
% A.2
b2 = [1 0 0];
a2 = [1 0 1/4];
delta = inline('n==0','n');
h2 = filter(b2,a2,delta(n));
figure
stem(n,h2,'k'); 
axis([-.5 30.5 -1.1 1.1]);
xlabel ('n'); 
ylabel('h2[n]');
title('h2[n]');
h1(3)
h2(3)
%%
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
title('Part B');
%%
%C
%x = 2cos(2pin/6)(u(n)-u(n-10)
u1= @(n)1.0.*(n>=0); %Unit Step is only 1 when n>=0
x = @(n)2.*cos(2.*pi.*n./6).*(u1(n)-u1(n-10));
y_1 = filter(b,a,x(n));
figure;
stem(n, y_1, 'g');
title('Part C');
%%
%D
y_total = filter(b,a,x(n),z_i);
figure;
stem(n, y_total);
title('Part D1');

%D.2
y_total2 = y_0 + y_1 ;
figure;
stem(n, y_total2);
title('Part D2');
%%
%E
x = x(n);
b= (0:1:length(x)+length(h)-2);
c=conv(x,h);
clf; 
figure;
stem(b, c, 'k');
xlabel('n'); 
ylabel('c[n]');
axis([0 30 -5 5]);
title('Part E');
%%
% F.1
N = 18;
one = ones(1, N);
a = one * 1/N;
b = [1,0,0];
n = (0:N); 
delta = inline('n==0','n');
h1 = filter(a,b,delta(n));
figure;
stem(n,h1,'k'); 
axis([0 N -2/N 2/N]);
xlabel ('n'); 
ylabel('h1[n]');
title('Part F1');

 %F.2 & F.3
n = (0:45);
xn = cos(pi.*n/5) + delta(n - 30) + delta(n-35);
delta = inline('n==0','n');
ns = [4 8 12];
figure;
for i = 1:numel(ns)
    c = pass_filter(ns(i), xn);
    subplot(length(ns), 1, i);
    stem(n, c, 'k');
    title(strcat('N = ', num2str(ns(i))));
end


function [a,b] = pass_filter(N, x)
a = x * 1/N;
b = [0,0,1];
end