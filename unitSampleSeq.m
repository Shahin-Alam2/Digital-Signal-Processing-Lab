clc
clear all;
close all;

a=2;
f=5;

t=0:0.01:1;
x=a*sin(2*pi*f*t);
y=a*cos(2*pi*f*t);
z=a*square(2*pi*f*t);

subplot(221)
plot(t,x)
title('Signal:')
m=fliplr(x);
t=-fliplr(t);
subplot(222)
plot(t,m)
title('Flip Signal:')
% n=0:0.01:1;
% s=a*sin(2*pi*f*n);
% subplot(222)
% k=0:length(n)-1;
% stem(k,s)
% title('Sampling:')
% grid


% subplot(222)
% plot(t,y)
% 
% subplot(223)
% plot(t,z)
% grid on

