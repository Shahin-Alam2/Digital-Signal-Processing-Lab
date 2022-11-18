clc 
clear all
close all

x=[1,1,2,2];
h=[1,2,3,4];
subplot(311)
stem(x)
title('x(n)')
xlabel('n values')
ylabel('amplitude')
subplot(312)
stem(h)
title('h(n)')
xlabel('n values')
ylabel('amplitude')

N1=length(x);
N2=length(h);
N=N1+N2-1;
x=[x,zeros(1,N-N1)];
h=[h,zeros(1,N-N2)];
y=zeros(1,N);
for n=1:N
    for m=1:N
        z=mod(n-m,N);
        y(n)=y(n)+x(m).*h(z);
    end
end
subplot(313)
stem(y)
title('Output y(n) Conv')
xlabel('n values')
ylabel('amplitude')
disp('y= ')
disp(y)