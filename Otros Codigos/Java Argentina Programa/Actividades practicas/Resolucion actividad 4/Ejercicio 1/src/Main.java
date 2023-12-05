import java.util.Arrays;
public class Main {
    public static void main(String[] args) {
        int [] vector = ingresoPorTeclado.registrar();
        char modo = ingresoPorTeclado.comoOrdenar();
        if (modo != 'e') {
            int[] vectorOrd = ordenamientoDeVector.ordenar(vector, modo);
            System.out.println(Arrays.toString(vectorOrd));
        }
        else
            System.out.println("Ingresó una letra invalida");
    }
}

