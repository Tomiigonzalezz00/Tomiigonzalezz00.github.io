import java.util.Arrays;

public class ordenamientoDeVector {
    public static int[] ordenar(int[] numingresados, char letra){
        int aux;
        switch (letra) {
            case 'a' -> {
                Arrays.sort(numingresados);
            }
            case 'd' -> {
                Arrays.sort(numingresados);
                for (int x = 0; x < numingresados.length / 2; x++) {
                    aux = numingresados[x];
                    numingresados[x] = numingresados[numingresados.length - x - 1];
                    numingresados[numingresados.length - x - 1] = aux;
                }

            }
        }
        return numingresados;
    }
}