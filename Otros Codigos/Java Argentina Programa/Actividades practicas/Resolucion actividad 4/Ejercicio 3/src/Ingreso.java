import java.util.Scanner;

public class Ingreso {
    static  Scanner teclado = new Scanner(System.in);
    public static char accion(){
        String ingresado;
        char cod;
        System.out.println("Ingrese si quiere codificar(c) o decodificar(d):");
        cod= teclado.nextLine().charAt(0);
        return cod;
    }

    public static int desplazamiento(){
        int desplazar=0;
        System.out.println("Ingrese el desplazamiento:");
        desplazar = teclado.nextInt();
        return desplazar;
    }

}
