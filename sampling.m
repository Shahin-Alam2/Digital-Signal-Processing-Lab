clc
clear all;
close all;

t=0:0.001:1;
f=100;
fs1=200;
fs2=50;

x=5*cos(2*pi*f*t);
t1=0:1/fs1:1;
y=5*cos(2*pi*f*t1);
t2=0:1/fs2:1;
z=5*sin(2*pi*f*t2);

%subplot(221)
plot(t1,y,'rx-',t2,z,'bo-');
legend('Sampling 200','Sampling 50');