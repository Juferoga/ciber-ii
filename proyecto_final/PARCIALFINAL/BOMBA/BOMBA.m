%% Procedimento de cargue de datos
% cargamos la entrada
input_1 = PruebaBomba4V(:,2);
% cargamos la salida
output_1 = PruebaBomba4V(:,3);
% Entramos en ident

ident
%% Proceso ident
% Una vez en ident importamos la data en dominio del tiempo,
% luego Estimamos por medio de variables de estados,
% nos da un modelo estimado el cual debemos de tener en cuenta

%% Para este caso nos da: A,B,C,D con una estimación del  97.85%
% Podemos ver la grafica del LTI

%% HASTA ACÁ LLEVAMOS EL 70% :D
% Se exporta el modelo y se realiza el paso a variables del sistema de
% estados
A = ss1.A;
B = ss1.B;
C = ss1.C;
D = ss1.D;

%% Transfer function Matlab
[b,a] = ss2tf(A,B,C,D);

% Comprobamos
syms s;
I=[1 0 0 0;0 1 0 0; 0 0 1 0; 0 0 0 1];

%% lo pasamos a función de transferencia
H = tf(b,a); step(H)
step(H)

zita = abs(log(0.07)/sqrt(pi^2+(log(0.07))^2));
angulo = acosd(zita);
wn = 4.5/(0.6461*4.3633);

%% Guardamos los polos
polos = roots(a);

%% Ubicación del polo
i=sqrt(-1);
pd = zita*wn + i * wn*sqrt(1-zita^2);

%% Diseñamos el controlador
%%%estimar controlable%%%%
c1 =B*A;
c2=A^2*B;
c3=A^3;
%% función de transferencia del controlador
control = tf(b,a);

b_prima = b/0.2696;

zeros_sis = roots(b_prima);
polos_sis = roots(a);

t_establecimiento = 2*pi/0.36;

polos_sist_100 =100 *[ -0.0338 + 1.4865i;  -0.0338 - 1.4865i;  -0.0276 + 0.0000i;  -0.0036 + 0.0000i];

% se sacan lo polos y los ceros
pid_z0= -1.0313+1.2186j+443.3857;
pid_z1= -1.0313+1.2186j-48.9293;
pid_z2= -1.0313+1.2186j-4.1979 ;

pid_p0 = -1.0313+1.2186j+0.3600;
pid_p1 = -1.0313+1.2186j+2.7600;
pid_p2 = -1.0313+1.2186j+3.3800+1.4865e+02i;
pid_p3 = -1.0313+1.2186j+3.3800-1.4865e+02i;


% se realiza la arcotangente en grados
%% Hallamos los anngulos :D
phi_zo=atand(imag(pid_z0)/real(pid_z0));
phi_z1 = -1.3972  + 180;
phi_z2 = -13.1179 + 180;
%%%%%%%
phi_po = -61.1506 + 180;
phi_p1=atand(imag(pid_p1)/real(pid_p1));
phi_p2=atand(imag(pid_p2)/real(pid_p2));
phi_p3 = -89.0873 + 360;

%% Estimamos cuanto hace falta
sum_ang = phi_zo+phi_z1+phi_z2-phi_po-phi_p1-phi_p2-phi_p3;
angulo_pd = 360+sum_ang;
ang_final = 180 - angulo_pd;

%%% se reparten los 101 de forma arbitraria
w1=(1.2186/tan(60))-1.0313;
w2=(1.2186/tan(41))-1.0313;
%% Volvemos al 70% del diseño xD

%% Calculando la ganancia del sistema (k)
w1=(1.2186/tand(60))+1.0313;
w2=(1.2186/tand(41))+1.0313;

%% El PINCHE PARAMETRO DEL CONTROLADOR
Kd=(abs(pd)*abs(pid_p0)*abs(pid_p1)*abs(pid_p2)*abs(pid_p3))/(abs(pd+1.7349)*abs(pd+2.4331)*0.2696*abs(pid_z0)*abs(pid_z1)*abs(pid_z2));

mObs = obsv(A, C);
disp(mObs);

