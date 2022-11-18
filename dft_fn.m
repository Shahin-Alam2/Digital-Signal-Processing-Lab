clc
clear all
close all

t=0:0.001:1;
input_signal = sin(2*pi*1500*t) + 0.5*sin(2*pi*1785*t + 3*pi/4);
 figure(1)
 subplot(221)
 plot(t,input_signal) 
 title('Original Signal')
 
fs=8000;
ns=0:1/fs:1;
signal = sin(2*pi*1500*ns) + 0.5*sin(2*pi*1785*ns + 3*pi/4);

% 8 Point DFT
len=8;
n=0:len-1;

figure(2)
subplot(331)
plot(n,signal(1:len))
title('Signal ')  

y=calculate_dft(signal,-1,len,1);

subplot(332)
stem(n,real(y))
title('Real part:')
xlabel('Frequency(kHz)')
ylabel('Magnitude of y')

subplot(333)
stem(n,imag(y))
title('Imaginery part')

subplot(334)
stem(n,abs(y));
title('Magnitude')

%phase spectrum
subplot(335)
pr=phase(y); %phase in radian
p=rad2deg(pr); %phase in degree
stem(n,p)
title('Phase spectrum')

%power spectrum
subplot(336)
pw=abs(y).^2;
stem(n,pw)
title('Power spectrum')

%{
subplot(2,2,4);
plot(n,angle(y));
axis tight;
title("Angle spectrum");
%}
%Inverse DFT
inverse_dft=calculate_dft(y,1,len,len);
figure(1)
subplot(222)
plot(n,inverse_dft)
title('IDFT')


