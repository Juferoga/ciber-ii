classdef Dispositivo
    properties
        puerto
        baudrate
        conexion
    end

    methods
        function obj = Dispositivo(puerto, baudrate)
            obj.puerto = puerto;
            obj.baudrate = baudrate;

            % Intenta abrir una conexión serial.
            try
                obj.conexion = serial(obj.puerto, 'BaudRate', obj.baudrate);
                fopen(obj.conexion);
                disp('Conexión serial establecida.');
            catch
                % Si falla, intenta abrir una conexión USB.
                try
                    obj.conexion = serialport(obj.puerto, obj.baudrate);
                    disp('Conexión USB establecida.');
                catch
                    error('No se pudo establecer una conexión.');
                end
            end
        end

        function datos = leer(obj)
            % Lee los datos del dispositivo.
            datos = readline(obj.conexion);

            % Divide los datos en tiempo, variable a y variable b.
            valores = split(datos, ',');
            tiempo = str2double(valores(1));
            variable_a = str2double(valores(2));
            variable_b = str2double(valores(3));

            % Devuelve los datos como un arreglo.
            datos = [tiempo, variable_a, variable_b];
        end

        function cerrar(obj)
            % Cierra la conexión.
            fclose(obj.conexion);
            disp('Conexión cerrada.');
        end
    end
end
