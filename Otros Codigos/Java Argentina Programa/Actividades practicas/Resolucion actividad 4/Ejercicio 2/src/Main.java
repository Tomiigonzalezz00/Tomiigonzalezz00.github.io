import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.Arrays;
import java.util.Scanner;


public class Main {
    public static void main(String[] args) throws IOException {
        String ubicacion = "E:\\Github\\Github Desktop\\Mi-repositorio\\Otros Codigos\\Java Argentina Programa\\Actividades practicas\\Resolucion actividad 4\\Ejercicio 2\\numeros.txt";
        Scanner teclado = new Scanner(System.in);
        char letra;
        int [] numeros = leerArchivo(ubicacion);

        System.out.println("Los numeros son: " + Arrays.toString(leerArchivo(ubicacion)));
        System.out.println("¿Desea multiplicar (*) o sumar (+)? ");
        letra = teclado.next().charAt(0);
        switch (letra) {
            case '+' -> {
                System.out.print(Calculos.suma(numeros));
            }
            case '*' -> {
                System.out.print(Calculos.multiplicacion(numeros));
            }
            default -> {
                System.out.println("Operacion invalida");
            }

        }
    }

    private static int[] leerArchivo(String ruta) throws IOException {

        int i = 0, lineas = Files.readAllLines(Paths.get(ruta)).size();
        int [] numeros = new int [lineas];
        for(String unaLinea : Files.readAllLines(Paths.get(ruta))) {
            numeros[i] = Integer.valueOf(Files.readAllLines(Paths.get(ruta)).get(i));
            i++;
        }
        return numeros;
    }
