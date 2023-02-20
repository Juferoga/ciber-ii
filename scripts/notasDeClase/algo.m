clc;clear; close all;
grid on;
syms z wn;
mpp=input('Máximo sobreimpulso porcentual => ');
tp=input('Tiempo de pico => ');
mp=mpp/100;

Z=solve(exp(-z*pi/(sqrt(1-z^2)))==mp,z);
pretty(Z);
Z=max(eval(Z));

wn=eval(solve(tp==pi/(wn*sqrt(1-Z^2)),wn));

k=1;
num=[k*wn^2];den=[1,2*Z*wn,wn^2];
Gd=tf(num,den);
step(Gd);hold on;

for i=1:1:10
    Ga=tf([Z*wn*i],[1,Z*wn*i]);
    Gd3=series(Gd,Ga);
    step(Gd3);
end

% El polo se acerca a la señal inicial, la cual no se acerca.
%for i=1:1:10
%    Ga=tf([Z*wn*100],[1,Z*wn*100]);
%    Gd3=series(Gd,Ga);
%    step(Gd3);
%end