//AM GENERATION 
clc ;
clear ;
close ;
fm =3; 
fc =20; 
fs =100
t =0:1/ fs :3;
p = length ( t ) ;
am = input ("Enter the message signal amplitude=") ;
ac = input ("Enter carrier signal amplitude(ac>am)=") ;
msg = am *cos (2* %pi * fm * t ) ;
figure (1) ;
subplot (3 ,1 ,1) ;
plot (t , msg ) ;
xlabel ("TIME" ) ;
ylabel ("AMPLITUDE")
title ("Message x  Signal") ;

carrier = ac * cos (2* %pi * fc * t ) ;
subplot (3 ,1 ,2) ;
plot (t , carrier ) ;
xlabel ("TIME") ;
ylabel ("AMPLITUDE")
title ("C a r r i e r S i g n a l") ;
ka =1/ ac ; 
u = ka * am ;
disp ("The Mo d ula tio n I n d e x i s")
am_mod =(1+ ka .* msg ) .* carrier ;
subplot (3 ,1 ,3) ;
plot (t , am_mod ) ;

xlabel ("TIME") ;
ylabel ("AMPLITUDE")
title ("Ampli tude Modula ted S i g n a l ")

d =( - p /2:1: p /2 -1) *1/3;
figure (2)
subplot (3 ,1 ,1) ;
plot (d ,abs( fftshift ( fft ( am_mod ) ) ) ) ;

xlabel ("FREQUENCY&quot") ;
ylabel ("AMPLITUDE &quot")
title ("AM S i g n a l Spec t rum ")
demod = am_mod .* carrier ;
k = abs (fft ( demod )) ;
filt = [ ones (1 ,4* fm ) , zeros (1 ,p -4* fm ) ];
out = k .* filt ;
subplot (3 ,1 ,3) ;
plot (t , ifft ( out ) );
xlabel ("TIME &quot") ;
ylabel ("AMPLITUDE" ) ;
title ("Demodulated Me s sage")
