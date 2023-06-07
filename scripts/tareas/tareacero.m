G1=tf([0,1],[1 1]);
G2=tf([1,1],[0 1]);
G3=tf([1,1],[1 1]);
G4=tf([0,1],[0 1]);

subplot(2,2,1);
step(G1)
title("G1 System 0,1")
legend('T=5')

%subplot(2,2,2);
%step(G2)
%title("G2 System 1,0")
%legend('T=10')

subplot(2,2,3);
step(G3)
title("G3 System 1,1")
legend('T=15')

subplot(2,2,4);
step(G4)
title("G4 System 0,0")
legend('T=15')

hold on