clear;
close;

fs=300;
t=0:1/fs:2;
p=length(t);

fm=input("Enter the frequency of modulating signal:-");
fc=input("Enter the frequency of carrier signal(fc>>>fm):-");
am=input("Enter the amplitude of message signal:-");
ac=input("Enter the amplitude of Carrier Signal:-");

// Message signal Generation
msg=am*cos(2*%pi*fm*t);
figure(1);
subplot(3,1,1);
plot(t,msg);
xlabel("Time");
ylabel("Amplitude");
title("Message Signal");

// Carrier Signal
carrier = ac * cos(2*%pi*fc*t);
subplot(3,1,2);
plot(t,carrier);
xlabel("Time");
ylabel("Amplitude");
title("Carrier Signal");

// Modulation Index
kf = 4;
m = (kf*am)/fm;
disp("The modulation index is",m);

// Frequency modulated signal
fm_mod= ac*cos((2*%pi*fc*t)+(m.sin(2*%pi*fm*t)));
subplot(3,1,3);
plot(t,fm_mod);
xlabel("Time");
ylabel("Amplitude");
title("Frequency Modulated Signal");
