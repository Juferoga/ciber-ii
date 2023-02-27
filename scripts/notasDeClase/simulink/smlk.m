clear all;close all;
% Tao del sistema
T=2.5;
% Ganancia del sistema
k=0.75;
% Creación del denominador y numerador de la función de transferencia
den=[T,1];
num=k;
% Ganacia inicial
Kp=1;
% Tamaño del escalon unitario => recordar que si sequiere que el
% escalon empiece en cero agregar en step-time = 0
A=5;
% Carga del sistema en 5 taos
carga=T*5;
% Valor final de la función de transferencia sin lazo
valor_final_sl=k*5;
% Valor final de la función de transferencia sin lazo
%%% valor_final_l=k*5 TODO:Preguntar

%% Calculando TAO
Tao = T/(1+Kp+k);

tabla=zeros(10,3);

for Kp=1:1:10
    tabla(Kp,1)=Kp;
    Tao = T/(1+Kp+k);
    tabla(Kp,2)= Tao;
    tabla(k,3)=((Kp*k)/(1+Kp*k));
end
