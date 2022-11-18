clc
clear all
close all

a=5;
f=50;
t=0:0.001:1;
x=a*cos(2*pi*f*t);

figure(1)
subplot(221)
plot(t,x)
title('Signal:')
xlabel('Time(t)')
ylabel('Amplitude')
grid on;         

% Over Sampling
fs=200;
n=0:1/fs:1;
xOver=a*cos(2*pi*f*n);
subplot(222)
stem(n,xOver)
title('Over Sampling:')
xlabel('Time')
ylabel('Amp')
grid on

% Under Sampling
fs=75;
n=0:1/fs:1;
xUnder=a*cos(2*pi*f*n);
subplot(223)
stem(n,xUnder)
title('Under Sampling')
xlabel('Time')
ylabel('Amp')
grid on

% cross correlation to see difference or compare 2 signal

flipy=flip(xUnder);
xlen=length(xOver);
ylen=length(xUnder);
tlen=xlen+ylen-1;

%Xn=[xn,zeros(1,xlen)];
%Yn=[yn,zeros(1,ylen)];
Rxy=zeros(1,tlen);
for l=1:tlen
    %Rxy(l)=0
    for n=1:xlen
        if(l-1+1>0 && (l-n+1 <= ylen))
            Rxy(l)=Rxy(l)+xOver(n)*xUnder(l-n+1);
        end
    end
end

nl=min(xOver)+min(xUnder);
nh=max(xOver)+max(xUnder);
n=nl:1:nh;
subplot(224)
stem(n,Rxy)
title('Comparing by Cross')
xlabel('Time')
ylabel('Amp')
grid on