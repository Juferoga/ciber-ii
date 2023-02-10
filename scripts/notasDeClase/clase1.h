pkg load control

num=[1]
den=[3,4,1,2]
gs = tf(num,den)
polos=roots(den)
coef=poly(polos)
step(gs)

fprintf('Press any key to continue...\n')
waitforbuttonpress;
