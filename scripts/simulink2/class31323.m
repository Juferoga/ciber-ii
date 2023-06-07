clc; clear; close all;

A=5;
Ki=1;Kp=1;Kd=1;

num=[0.75];
den=[2 1];

Gs=tf(num,den);

step(Gs*A)
hold on; grid on

for Ki=0.5:0.5:5

    Cs = tf([Ki],[1 0]);
    Glc=feedback(series(Gs,Cs),1);
    
    step(Glc*A)
end
