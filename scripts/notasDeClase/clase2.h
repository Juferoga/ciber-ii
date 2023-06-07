pkg load control

R=1000
L=1
C=1

num=[1/L*C]
den=[1,R/L,1/L*C]
gs=tf(num,den)

step(gs)

fprintf('Press any key to continue...\n')
waitforbuttonpress;
