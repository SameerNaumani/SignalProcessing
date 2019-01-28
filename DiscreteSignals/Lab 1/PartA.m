%Part A Signal Transformation
%1)
%i
n = (-10:10);
h1= @(n)1.0*(n==0); %Delta function is only 1 at n = 0

figure;
subplot(2,1,1);
stem(n, h1(n-3)); %Use stem to plot
title('A.I');
grid;

%ii
u1= @(n)1.0*(n>=0); %Unit Step is only 1 when n>=0
subplot(2,1,2);
stem(n, u1(n+1));
title('A.II');
grid;

%iii
figure;
x = @(n) cos(pi.*n./5).*u1(n); %x(n) = cos((pi*n)/5)u(n)
subplot(2,2,1);
stem(n,x(n));
title('A.III');
grid;

%iv
x1 = @(n)x(n-3); %x1(n) = x(n-3)
subplot(2,2,2);
stem(n,x1(n));
title('A.IV');
grid;

%V
x2 = @(n)x(-n); %x2(n) = x(-n)
subplot(2,2,3);
stem(n,x2(n));
title('A.V');
grid;

%%Explain what transformations are performed in x1(n) and x2(n)
% In x1(n) the transformation that is performed is a time shift to the
% right by 3.
% In x2(n) the transformation that is performed is a time reversal noted by
% the x(-n).
% % % %                  









