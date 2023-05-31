% Reemplaza 'COM3' con el puerto al que tu dispositivo está conectado.
puerto = 'COM3'; 
baudrate = 9600; % Reemplaza esto con el baudrate correcto de tu dispositivo.
puerto_serial = serial(puerto, 'BaudRate', baudrate);

% Abre el puerto serial.
fopen(puerto_serial);

% Lee los datos del puerto serial.
datos = fgetl(puerto_serial);

% Divide los datos en tiempo, variable a y variable b.
valores = split(datos, ',');
tiempo = str2double(valores(1));
variable_a = str2double(valores(2));
variable_b = str2double(valores(3));

% Inicializa los arreglos para almacenar los datos.
tiempos = [];
variables_a = [];
variables_b = [];

% Crea una figura para el gráfico.
fig = figure;

while ishghandle(fig)
    % Lee los datos del puerto serial.
    datos = fgetl(puerto_serial);

    % Divide los datos en tiempo, variable a y variable b.
    valores = split(datos, ',');
    tiempo = str2double(valores(1));
    variable_a = str2double(valores(2));
    variable_b = str2double(valores(3));

    % Añade los datos a los arreglos.
    tiempos = [tiempos, tiempo];
    variables_a = [variables_a, variable_a];
    variables_b = [variables_b, variable_b];

    % Grafica los datos.
    plot(tiempos, variables_a, 'r', tiempos, variables_b, 'b');
    drawnow;
end

% Cierra el puerto serial cuando termines.
fclose(puerto_serial);


