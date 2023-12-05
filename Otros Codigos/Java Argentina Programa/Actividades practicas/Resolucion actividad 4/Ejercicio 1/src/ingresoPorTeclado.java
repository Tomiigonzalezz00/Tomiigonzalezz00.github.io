import java.util.Scanner;

public class ingresoPorTeclado {
    public static int[] registrar() {
        int[] ningresados = new int[3];
        Scanner teclado = new Scanner(System.in);
        System.out.println("Ingrese los numeros a evaluar");
        for (int i = 0; i < ningresados.length; i++) {
            ningresados[i] = teclado.nextInt();
        }
        return ningresados;
    }

    public static char comoOrdenar(){
        char letra;
        Scanner teclado = new Scanner(System.in);
        System.out.println("Ingrese la forma de ordenamiento: Ascendente(a) o Decreciente(d)");
        letra = teclado.next().charAt(0);
        if(letra == 'a' || letra =='d')
            return letra;
        else
        return 'e';
    }
}
