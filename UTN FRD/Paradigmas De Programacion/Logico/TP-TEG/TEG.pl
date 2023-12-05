%-------------------------------BASE DE DATOS-----------------------------------------------------------------------------
continente(americaDelSur).
continente(americaDelNorte).
continente(asia).
continente(oceania).

estaEn(americaDelSur, argentina).
estaEn(americaDelSur, brasil).
estaEn(americaDelSur, chile).
estaEn(americaDelSur, uruguay).
estaEn(americaDelNorte, alaska).
estaEn(americaDelNorte, yukon).
estaEn(americaDelNorte, canada).
estaEn(americaDelNorte, oregon).
estaEn(asia, kamtchatka).
estaEn(asia, china).
estaEn(asia, siberia).
estaEn(asia, japon).
estaEn(oceania,australia).
estaEn(oceania,sumatra).
estaEn(oceania,java).
estaEn(oceania,borneo).

jugador(amarillo).
jugador(magenta).
jugador(negro).
jugador(blanco).


%el numero son los ejercitos
ocupa(argentina, magenta, 5).
ocupa(chile, negro, 3).
ocupa(brasil, amarillo, 8).
ocupa(uruguay, magenta, 5).

ocupa(alaska, amarillo, 7).
ocupa(yukon, amarillo, 1).
ocupa(canada, amarillo, 10).
ocupa(oregon, amarillo, 5).
ocupa(kamtchatka, negro, 6).
ocupa(china, amarillo, 2).
ocupa(siberia, amarillo, 5).
ocupa(japon, amarillo, 7).
ocupa(australia, negro, 8).
ocupa(sumatra, negro, 3).
ocupa(java, negro, 4).
ocupa(borneo, negro, 1).

%Usar este para saber si son limitrofes ya que es una relacion simetrica
sonLimitrofes(X, Y) :- limitrofes(X, Y).
sonLimitrofes(X, Y) :- limitrofes(Y, X).

limitrofes(argentina,brasil).
limitrofes(argentina,chile).
limitrofes(argentina,uruguay).
limitrofes(uruguay,brasil).
limitrofes(alaska,kamtchatka).
limitrofes(alaska,yukon).
limitrofes(canada,yukon).
limitrofes(alaska,oregon).
limitrofes(canada,oregon).
limitrofes(siberia,kamtchatka).
limitrofes(siberia,china).
limitrofes(china,kamtchatka).
limitrofes(japon,china).
limitrofes(japon,kamtchatka).
limitrofes(australia,sumatra).
limitrofes(australia,java).
limitrofes(australia,borneo).
limitrofes(australia,chile).

%------------------------------------------------------TERMINA BASE DE DATOS-----------------------------------------------
%1
puedenAtacarse(Jugador1,Jugador2):-
  ocupa(Pais1,Jugador1,_),
  ocupa(Pais2,Jugador2,_),
  sonLimitrofes(Pais1,Pais2),
  not(aliados(Jugador1,Jugador2)),
  Jugador1\=Jugador2.
%2
estaTodoBien(Jugador1,Jugador2):- not(puedenAtacarse(Jugador1,Jugador2)).
%3
loLiquidaron(jugador):-not(ocupa(_,jugador,_)).
%4
ocupaContinente(Jugador,Continente):-
  continente(Continente),
  jugador(Jugador),
  forall(estaEn(Continente,Pais), ocupa(Pais,Jugador,_)).
  /*para todo pais q esta en un continente se cumple que un jugador lo ocupa*/
%5
estaPeleado(Continente):-
  continente(Continente),
  forall(jugador(Jugador),(ocupa(Pais,Jugador,_),estaEn(Continente,Pais))).
  /*para los continentes en los cuales cada jugador ocupa algún país*/
%6
seAtrinchero(Jugador):- 
  jugador(Jugador),
  continente(Continente),           
  forall(ocupa(Pais,Jugador,_),estaEn(Continente,Pais)).
  /*para los jugadores que ocupan países en un único continente*/
  
continente(Continente):- 
    estaEn(Continente,_).
    jugador(Jugador):-ocupa(_,Jugador,_).
/*para q cuando pregunte me devuelva continente o lo quiera sino problema de inversibilidad*/

elPaisMasFuerte(Pais):-
  forall(ocupa(Pais,_,Ejercito1),(ocupa(_,_,Ejercito2),Ejercito1>Ejercito2)).
%7
elQueTieneMasEjercitos(Jugador,Pais):-
    elPaisMasFuerte(Pais),
    ocupa(Pais,Jugador,_).
/*que relaciona un jugador y un país si se cumple que es en ese país que hay más ejércitos que 
en los países del resto del mundo y a su vez ese país es ocupado por ese jugador.*/
%8
seguroGanaContra(Pais1,Pais2):-
    limetrofes(Pais1,Pais2),
    ocupa(Pais1,_,Ejercito1), ocupa(Pais2,_,Ejercito2),Ejercito1>(2*Ejercito2).

/*relaciona dos países limítrofes de diferentes jugadores y es cierto cuando el primero tiene más
 del doble de ejércitos que el segundo*/
%9
cuantoAgregaParaGanarSeguro(Pais1,Pais2,Cantidad):-
    ocupa(Pais1,Jugador1,Ejercito1),ocupa(Pais2,Jugador2,Ejercito2),
    limitrofes(Pais1,Pais2),
    Ejercito2 < (Ejercito1 + Cantidad).

/*que relaciona dos países limítrofes de diferentes jugadores y una cantidad, y es cierto cuando esa
cantidad es la cantidad de ejércitos que tengo que ponerle al primer país para que le gane seguro al segundo*/