%PART C N-Point maximum filter

n = (0:44);



%Define the input function x(n)
d = @(n)1.0*(n==0); %Delta function
x1 = @(n) cos(pi.*n./5) + d(n-20) + d(n-35);


%Maximum function 
N = input('Enter N value:');
y = my_max(x1(n),N);
figure;
stem(n,y(n));

function [y] = my_max(x,N)
M = length(x);
y = zeros(1,M);
x = [zeros(1,N-1) x];

for i = 1:M
    check = max(x(i:i+N-1));
    y(i) = check;
end
end
%y(i) = max(x(I) x(I+1) ... x(I+N))  





%x = (n:45);
%M = length(x);
%y = (N-1:M); 
 

