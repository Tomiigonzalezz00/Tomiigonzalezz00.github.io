import java.io.IOException;
import java.util.Arrays;
import java.util.Scanner;
public class Main {
    public static void main(String[] args) throws IOException {
        char cod_decod = Ingreso.accion();
        int despazamiento = Ingreso.desplazamiento();
        char cadena [] = Archivos.lectura();

        Archivos.limpiar();
        switch (cod_decod){
            case 'c':
                    Accion.codificacion(cadena,despazamiento);
                     System.out.println("Cadena codificada correctamente");
                break;
            case 'd':
                Accion.decodificacion(cadena,despazamiento);
                System.out.println("Cadena decodificada correctamente");
                break;
            default:
                System.out.println("Ingresó una letra invalida");
        }

    }
}

