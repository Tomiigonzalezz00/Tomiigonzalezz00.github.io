public class Calculos {
    public static int suma(int [] sumandos){
        int total=0;
        for(int i = 0;i< sumandos.length;i++){
            total = total + sumandos[i];
        }
        return total;
    }

    public static int multiplicacion(int [] factores){
        int total=1;
        for(int i = 0;i< factores.length;i++){
            total = total * factores[i];
        }
        return total;
    }
}
