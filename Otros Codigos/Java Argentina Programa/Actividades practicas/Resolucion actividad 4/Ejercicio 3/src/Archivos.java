import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardOpenOption;

public class Archivos {

    static String ruta = "E:\\Github\\Github Desktop\\Mi-repositorio\\Otros Codigos\\Java Argentina Programa\\Actividades practicas\\Resolucion actividad 4\\Ejercicio 3\\";

    public static char [] lectura() throws IOException { //Lee el archivo entrada

        String ruta_l = ruta + "entrada.txt";
        String letras_totales = Files.readString(Paths.get(ruta_l));
        char [] letras = new char [letras_totales.length()];
        for(int i =0; i < letras_totales.length(); i++) {
            letras[i] = letras_totales.charAt(i);
        }
        return letras;
    }

    public static void escritura(char salida) throws IOException { //Escribe el archivo salida
        String ruta_e = ruta + "salida.txt";
        String palabraAEscribir = String.valueOf(salida);
        Files.writeString(Paths.get(ruta_e), palabraAEscribir, StandardOpenOption.APPEND);
    }

    public static void limpiar() throws IOException {
        String limpiar_ruta = ruta + "salida.txt";
        Files.writeString(Paths.get(limpiar_ruta),"");
    }


}


