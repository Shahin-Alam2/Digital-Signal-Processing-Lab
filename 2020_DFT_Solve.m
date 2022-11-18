clc
clear all
close all

a1=5;
a2=10;
f1=50;
f2=100;
t=0:0.001:1;

x1=a1*cos(2*pi*f1*t);
x2=a2*cos(2*pi*f2*t);

x=x1+x2;

figure(1)
subplot(221)
plot(t,x)
title('Composite Signal:')
xlabel('Time')
ylabel('Amp')
grid on

N=8;


X=zeros(N,1);
for m=0:N-1
    for n=0:N-1
        X(m+1)=X(m+1)+(x(n+1)*exp(-2i*pi*m*n/N));
    end
end
n=0:N-1;

figure(2)
subplot(3,2,1)
stem(n, real(X)), title('DFT Real part')
subplot(3,2,2)
stem(n, imag(X)),title('Imaginary part')
subplot(3,2,3)
stem(n, abs(X)),title('Magnitude')
