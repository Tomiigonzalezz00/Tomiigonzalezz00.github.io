%--------------------COMIENZA BASE DE DATOS-------------------------
%monstruo (nombre,tamaño,peligrosidad,[caracteristicas])
monstruo(godzilla,100,5,terrestre).
monstruo(godzilla,100,5,colmillos).
monstruo(godzilla,100,5,coraza).

monstruo(sullivan,50,1,pelos).
monstruo(sullivan,50,1,simpatico).


caracteristicaTerrible(colmillos).
caracteristicaTerrible(garras).
caracteristicaTerrible(coraza).
caracteristicaTerrible(aguijon).


%-------------------TERMINA BASE DE DATOS------------------------------

%Ejercicio 1) 

puntosOtorgados(Monstruo,Puntaje):-
    monstruo(Monstruo,Tamanio,Peligrosidad,Caracteristica),
    caracteristicaTerrible(Caracteristica),
    Puntaje is ((2/10) * Tamanio)*(2* Peligrosidad) + 10.

puntosOtorgados(Monstruo,Puntaje):-
    monstruo(Monstruo,Tamanio,Peligrosidad,Caracteristica),
    Puntaje is ((2/10) * Tamanio)*(2* Peligrosidad).


%Ejercicio 3) 
%cazador(nombre, medallasrecibidas , puntajeacumulado, especialidad).
cazador(hunter, 1 , 100, acuatico).
cazador(chasseur, 0, 5000, todoTerreno(50)).
cazador(hanna, 3 , 300, acuatico).
cazador(juja, 3 , 500, todoTerreno(80)).
cazador(juani, 4 , 400, peliplumifero).
cazador(tomi, 4 , 400, bipedo).

