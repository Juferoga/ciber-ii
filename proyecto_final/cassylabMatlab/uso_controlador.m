% uso_controlador.m
addpath('ruta/a/tu/directorio');

% Crea una instancia de la clase Dispositivo.
d = Dispositivo('COM3', 9600);

% Lee datos del dispositivo.
datos = d.leer();

% Cierra la conexión cuando termines.
d.cerrar();
