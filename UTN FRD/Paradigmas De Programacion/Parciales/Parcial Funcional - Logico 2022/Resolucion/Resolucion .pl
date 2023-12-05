%---------------------BASE DE DATOS ------------------------
%jugador(nombre,habilidad,motivacion)
jugador(messi,100,muymotivado).
jugador(alvarez,60,motivado).
jugador(depaul,45,pocomotivado).
jugador(aguero,10,nomotivado).


video(mundial86,15,maradona).
video(mundial90,10,caniggia).
video(mundial78,120,kempes).

habilidadAlta(40).

vio(messi,mundial86).
vio(alvarez,mundial90).
vio(depaul,mundial86).

%------------------------------------------TERMINA BASE DE DATOS------------------------
%Ejercicio 1) 
loAyudaVideo(Jugador,Video):-
    video(Video,Duracion,_),
    100 < Duracion,
    jugador(Jugador,_,Motivacion),
    Motivacion = pocomotivado.

loAyudaVideo(Jugador,Video):-
    video(Video,_,maradona),
    jugador(Jugador,_,_).
    
loAyudaVideo(Jugador,Video):-
    video(Video,_,_),
    jugador(Jugador,Habilidad,Motivacion),
    Motivacion \= nomotivado,
    habilidadAlta(Valor),
    Habilidad > Valor.

%Ejercicio 2) 
loAyudaronTodosLosVideos(Jugador):-
    jugador(Jugador,_,_),
    vio(Jugador,_),
    forall(vio(Jugador,Video), loAyudaVideo(Jugador,Video)).

%Ejercicio 3) 

ayudarATodosLosJugadores(Video):-
    video(Video,_,_),
    forall(jugador(Jugador,_,_),loAyudaVideo(Jugador,Video)).


%Ejericio 4)
recomendacionesPosibles(Jugador,Video):-
    jugador(Jugador,_,_),
    video(Video,_,_),
    forall(loAyudaVideo(Jugador,Video),not(vio(Jugador,Video))).

%Ejercicio 5)
/*INVERSIBILIDAD: Decimos que un predicado es inversible cuando admite consultas con variables libres para sus argumentos. En otras palabras, cuando podemos consultar por cada uno de sus argumentos dejando otro constante, dandome como solucion los valores que satisfacen esas variables libres 
*/