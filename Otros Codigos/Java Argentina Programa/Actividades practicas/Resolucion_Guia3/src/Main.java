//import java.util.Scanner;
//Descomentar el ejercicio que se quiere ejecutar
//Ejercicio 1-A
/* public class Main {
    public static void main(String[] args) {
        String ingresado;
        char letra;
        int veces=0;
        Scanner teclado = new Scanner(System.in);
        System.out.println("Ingrese la cadena a evaluar");
        ingresado = teclado.nextLine();
        System.out.println("Ingrese la letra a evaluar");
        letra = teclado.next().charAt(0);

        for (int i=0; i < ingresado.length(); i++){
            if(letra == ingresado.charAt(i)) {
                    veces= veces+1;
            }
        }
        System.out.println("La letra se repite " +veces+ " vez/veces");
    }
}*/

//Ejercicio 1-B
/*import java.util.Arrays;
public class Main {
    public static void main(String[] args) {
        int[] numingresados = new int[3];
        int letra,aux;

        Scanner teclado = new Scanner(System.in);
        System.out.println("Ingrese los numeros a evaluar");
        for (int i=0; i < numingresados.length; i++){
            numingresados[i] = teclado.nextInt();
            }
        System.out.println("Ingrese la forma de ordenamiento: Ascendente(a) o Decreciente(d)");
        letra = teclado.next().charAt(0);

        switch(letra){
            case 'a':
                Arrays.sort(numingresados);
                System.out.println(Arrays.toString(numingresados));
            break;
            case 'd':
                Arrays.sort(numingresados);

                for(int x = 0 ; x < numingresados.length/2 ; x++){
                    aux = numingresados[x];
                    numingresados[x] = numingresados[numingresados.length-x-1];
                    numingresados[numingresados.length-x-1] = aux;
                }
                System.out.println(Arrays.toString(numingresados));
            break;
            default:
                System.out.println("Ingresó una letra invalida");
        }
    }
}*/
//Ejercicio 1-C
/*public class Main {
    public static void main(String[] args) {
        int[] numingresados = new int[50];
        int numero, total = 0,x = 0;
        char otro = 's';
        Scanner teclado = new Scanner(System.in);

        System.out.println("Complete el vector con numeros:");
        while (otro == 's') {
            numingresados[x] = teclado.nextInt();
            x = x + 1;
            System.out.println("¿Desea ingresar otro numero?");
            otro = teclado.next().charAt(0);
            if(otro == 's'){
                System.out.println("Ingrese otro numero");
            }
        }

        System.out.println("Ingrese el numero para comparar");
        numero = teclado.nextInt();

        for (int i = 0; i < numingresados.length; i++) {
            if(numingresados[i]>numero){
                total = total + numingresados[i];
            }
        }
        System.out.println("La suma de los numeros mayores a "+numero+" es: "+total);
    }
}
*/

//Ejercicio 2
/*
public class Main {
    public static void main(String[] args) {
        String ingresado, codificacion;
        int desplazamiento = 0;
        char letraCodificada;
        Scanner teclado = new Scanner(System.in);

        System.out.println("Ingrese la cadena a evaluar");
        ingresado = teclado.nextLine();

        System.out.println("Ingrese la codificiacion");
        codificacion = teclado.nextLine();

        System.out.println("Ingrese el desplazamiento");
        desplazamiento = teclado.nextInt();


        for (int i = 0; i < ingresado.length(); i++) {
            codificacion = codificacion + codificacion;
            if (ingresado.charAt(i) != ' ') {
                letraCodificada = codificacion.charAt(codificacion.indexOf(ingresado.charAt(i)) + desplazamiento);
                System.out.print(letraCodificada);
            } else
                System.out.print(" ");
        }
    }
}
*/