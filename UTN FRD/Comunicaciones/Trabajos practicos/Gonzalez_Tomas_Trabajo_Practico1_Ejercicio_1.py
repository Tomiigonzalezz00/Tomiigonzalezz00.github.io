import numpy as np
import matplotlib.pyplot as plt
from scipy.integrate import quad 


#Presentacion
print("Ejercicio 1 Trabajo practico de comunicaciones. Para salir ingrese 0 como coeficiente \n")
print("Se graficara con color verde la funcion generatriz y con linea roja punteada la serie de fourier de la funcion periodica generada \n")

# Defino Constantes para facilitar la lectura del codigo
pi = np.pi
seno = np.sin
cos= np.cos

#Periodo, amplitud y definicion de Wo
A=int(input("Ingrese la amplitud de las funciones: ")) 
T= int(input("Ingrese el periodo de las funciones: ")) 
 
Wo = 2*pi*(1/T)

#Funciones sobre las cuales voy a trabajar

def funcion_1(t):
    return np.piecewise(t,[abs(t)<1/2,abs(t)>1/2],[lambda t: A ,lambda t: 0])

def funcion_2(t):
    T = (2*pi)/Wo
    return np.piecewise(t,[(0<=t) & (t<= (T/2)),((-T/2)<=t) & (t<=0)],[lambda t:A*seno(Wo*t), lambda t: 0])

def funcion_3(t):
    return np.piecewise(t, [(-T/2 <= t) & (t <= T/2)], [lambda t: A * abs(np.sin(Wo* t))])

def funcion_4(t):
    return np.piecewise(t, [(0<=t) & (t<= (T/2)),((-T/2)<=t) & (t<=0)],[lambda t: (-4*A/T)*t+A, lambda t: (4*A/T)*t+A])

#Calculo de serie de fourier
def serieDeFourier(funcion,maxcoeficientes):
    #creo listas con coeficientes, empiezan vacias
    An = []
    Bn = []
    for n in range(maxcoeficientes+1):
        if (n==0): #Si n=0, se trata de la componente continua
            An.append((1/T)*quad(funcion,-T/2,T/2)[0]) #Calculo de A0, fuera del calculo principal de coeficientes
            Bn.append(0) #Se agrega un cero en la primer posicion para que en el calculo principal de los coeficientes, ambos empiecen cargando los valores desde la posicion "1"
        else: #Si no es 0, calculo los coerficientes
            def funcionA(t): #Defino a la funcionA que es la funcion original multiplicada por los cosenos
                return funcion(t) * cos(Wo*n*t) 
            def funcionB(t): #Defino a la funcionA que es la funcion original multiplicada por los senos
                return funcion(t)*seno(Wo*n*t)
            #Calculo los distintos coeficientes
            An.append((1/T)*quad(funcionA,-T/2,T/2)[0])
            Bn.append((1/T)*quad(funcionB,-T/2,T/2)[0])
      
    sum = 0 #Inicializo la sumatoria de la serie de fourier en 0
    for n in range(1,maxcoeficientes+1):
            sum += (An[n]*cos(Wo*n*t) + Bn[n]*seno(Wo*n*t))
            print("A"+ str(n),"=", An[n]," | B"+ str(n),"=",Bn[n]) #Muestro en pantalla los coeficientes obtenidos 

    print("A0 =",An[0])
    return An[0]+2*sum 
    
#Parte principal del programa, donde se ejecuta la funcion serieDeFourier definida mas arriba
while(1):
    maxcoeficientes = int(input("Ingrese la cantidad de coeficientes: ")) #Solicito la cantidad de coeficientes
    t = np.arange(-T*maxcoeficientes/2,T*maxcoeficientes/2,0.001) #Se define el rango de la serie de fourier para que sea periodica 
    if(maxcoeficientes==0): #Cuando la cantidad es 0, termino el programa
        break
   
# Parte de grafico
# Se defienen 4 graficos ordenados en una cuadrilla de 2x2
    fig, axs = plt.subplots(2, 2)

    # Calculo la serie de Fourier de funcion 1
    print("Coeficientes Funcion 1:")
    axs[0, 0].plot(t,serieDeFourier(funcion_1,maxcoeficientes), 'r--')
    axs[0, 0].plot(t, funcion_1(t), 'g',linewidth = 2)
    axs[0, 0].title.set_text("Función 1")
    axs[0, 0].set_ylabel("Amplitud")
 

    # Calculo la serie de Fourier de funcion 2
    print("Coeficientes Funcion 2:")
    axs[0, 1].plot(t, serieDeFourier(funcion_2,maxcoeficientes), 'r--')
    axs[0, 1].plot(t, funcion_2(t),'g',linewidth = 2)
    axs[0, 1].title.set_text("Función 2")
    axs[0, 1].set_ylabel("Amplitud")
  

    # Calculamos la serie de Fourier 
    print("Coeficientes Funcion 3:")
    axs[1, 0].plot(t, serieDeFourier(funcion_3,maxcoeficientes), 'r--',linewidth = 2)
    axs[1, 0].plot(t, funcion_3(t),'g')
    axs[1, 0].title.set_text("Función 3")
    axs[1, 0].set_ylabel("Amplitud")
    
    

    # Calculamos la serie de Fourier 
    print("Coeficientes Funcion 4:")
    axs[1, 1].plot(t, serieDeFourier(funcion_4,maxcoeficientes), 'r--')
    axs[1, 1].plot(t, funcion_4(t),'g',linewidth = 2)
    axs[1, 1].title.set_text("Función 4")
    axs[1, 1].set_ylabel("Amplitud")
    

    # Se define el tamaño de la ventana
    fig.set_size_inches(8, 8)

    # Muestreo de graficos
    plt.show()
