import java.io.IOException;

public class Accion {

    static String codificacion= "abcdefghijklmnñopqrstuvwxyz";
    public static void codificacion(char [] ingresado, int desplazamiento) throws IOException {


        char letraCodificada;
        for (int i = 0; i < ingresado.length; i++) {
            codificacion = codificacion + codificacion;
            if (ingresado[i] != ' ') {
                letraCodificada = codificacion.charAt(codificacion.indexOf(ingresado[i]) + desplazamiento);
                Archivos.escritura(letraCodificada);
            } else
                Archivos.escritura((" ").charAt(0));
        }
    }

    public static void decodificacion(char [] ingresado, int desplazamiento) throws IOException {

        char letraDecodificada;
        for (int i = 0; i < ingresado.length; i++) {
            codificacion = codificacion + codificacion;
            if (ingresado[i] != ' ') {
                letraDecodificada = codificacion.charAt(codificacion.indexOf(ingresado[i]) + 27 - desplazamiento);
                Archivos.escritura(letraDecodificada);
            } else
                Archivos.escritura((" ").charAt(0));
        }
    }
}
