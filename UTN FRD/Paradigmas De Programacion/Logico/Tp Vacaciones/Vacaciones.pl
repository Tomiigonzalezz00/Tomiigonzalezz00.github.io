%-------------------------------------COMIENZA BASE DE DATOS ------------------------------------------------------------------
%ciudad(ciudad, AnioFundacion, provincia).
provincia(rionegro).
provincia(bsas).
provincia(stacruz).
provincia(cordoba).




ciudad(mdq, 1876, bsas).
ciudad(bariloche, 1880, rionegro).
ciudad(viedma, 1776, rionegro).
ciudad(calafate, 1930, stacruz).
ciudad(carlosPaz, 1958, cordoba).
ciudad(lanus, 1888, bsas).



%alojamiento(ciudad, alojamiento, cantidad).
alojamiento(bariloche, camping, 2).
alojamiento(bariloche, hotel, 12).
alojamiento(bariloche, hosteria, 5).
alojamiento(mdq, hotel, 100).
alojamiento(mdq, camping, 10).
alojamiento(mdq, residencial, 5).
alojamiento(mdq, hosteria, 5).
alojamiento(viedma, camping, 3).
alojamiento(calafate, camping, 2).
alojamiento(calafate, hosteria, 3). 
alojamiento(carlosPaz, camping, 2).
alojamiento(carlosPaz, hotel, 8).

%Capacidad promedio de cada categoria de alojamiento
capacidad(hotel, 50).
capacidad(camping, 100).
capacidad(hosteria, 30).
capacidad(residencial, 10).

%informacion Adicional 
provinciaGrande(bsas,0.9).
provinciaPatagonica(rionegro,2010).
provinciaPatagonica(stacruz,2003).

provinciaComun(cordoba).

montoPorLugar(10).

coeficiente(comun, 1.1).
coeficiente(2010, 1.2).
coeficiente(2009, 1.4).
coeficiente(2008, 1.5).


%--------------------------------TERMINA BASE DE DATOS----------------------------------------------------------------------

%1)Realizar predicados que resuelvan lo siguiente y justificar si son inversibles o no. Mostrar ejemplos de consulta.
%A)

mismoSiglo(Anio1,Anio2) :- Anio1//100 =:= Anio2//100.

tieneMasDeUnaCiudad(Provincia):- 
        ciudad(X,Anio1,Provincia),
        ciudad(Y,Anio2,Provincia),
        X \= Y,
        mismoSiglo(Anio1,Anio2).

%B)
algunaCiudadNoDisponeDeAlojamiento(Provincia):- %le paso como parametro una provincia
        ciudad(Ciudad,_,Provincia), %todas las ciudades que pertenezcan a esa provincia
        not(alojamiento(Ciudad,_,_)). %evaluo si NO tienen un alojamiento. la parte (alojamiento(ciudad,_,_) me da las ciudades que si  tienen, y al negarla con el not, las que no) 

%C) 
unicaCategoriaDeAlojamiento(Ciudad):-
        alojamiento(Ciudad,Categoria1,_),
        forall(alojamiento(Ciudad,Categoria2,_), Categoria1 == Categoria2). 

%2) 
%A) 
capacidad(Ciudad,Categoria,Capacidad):- 
        ciudad(Ciudad,_,_),
        alojamiento(Ciudad,Categoria,Cantidad),
        capacidad(Categoria,CapacidadAlojamiento),
        Capacidad is (Cantidad*CapacidadAlojamiento).

%B) mayorCategoriaDeAlojamiento/2 Relaciona cada  ciudad, con la categoria de alojamiento que más lugares dispone
mayorCategoriaDeAlojamiento(Ciudad,Categoria):-
        alojamiento(Ciudad,Categoria,_),
        capacidad(Ciudad,Y,CapacidadAlojamiento),
        forall(capacidad(Ciudad,X,CapacidadAlojamiento1),CapacidadAlojamiento >= CapacidadAlojamiento1).

/*C) mayorCiudadCon/2 Relaciona cada  categoria de alojamiento con la ciudad que mas lugares dispone de dicha categoría. */

mayorCiudadCon(Ciudad,Categoria):-
        alojamiento(Ciudad,Categoria,Cantidad),
        forall(alojamiento(X,Categoria,Cantidad1), Cantidad >= Cantidad1).

%3) 
/*La Secretaría de turismo implementa un sistema de subsidios para fomentar la actividad, por el que por mes(?) transfiere fondos a las ciudades. El monto a transferir equivale a un monto fijo (que actualmente es de $10) por cada lugar disponible, por un coeficiente que depende de la provincia que sea: Para las provincias patagónicas el coeficiente depende del año de incorporación al sistema de subsidios, para los provincias grandes se sabe el coeficiente que le corresponde a cada una y para las provincias comunes, el coeficiente es para todos el mismo. Se desea saber cuántos fondos le corresponden a cada ciudad por cada categoría de alojamiento.
se sabe que

provinciaGrande(bsas,0.9).
provinciaPatagonica(rionegro,2010).
provinciaPatagonica(stacruz,2003).

provinciaComun(cordoba).

montoPorLugar(10).

coeficiente(comun, 1.1).
coeficiente(2010, 1.2).
coeficiente(2009, 1.4).
coeficiente(2008, 1.5).*/

fondoCorrespondiente(Ciudad,Categoria,Fondos) :- 
        ciudad(Ciudad,_,Provincia),
        alojamiento(Ciudad,Categoria,_),
        provinciaGrande(Provincia,Coeficiente),
        capacidad(Ciudad,Categoria,CapacidadAlojamiento),
        Fondos is (CapacidadAlojamiento*10*Coeficiente).

fondoCorrespondiente(Ciudad,Categoria,Fondos) :- 
        ciudad(Ciudad,_,Provincia),
        alojamiento(Ciudad,Categoria,_),
        provinciaPatagonica(Provincia,Anio),
        coeficiente(Anio,Coeficiente),
        capacidad(Ciudad,Categoria,CapacidadAlojamiento),
        Fondos is (CapacidadAlojamiento*10*Coeficiente).

fondoCorrespondiente(Ciudad,Categoria,Fondos) :- 
        ciudad(Ciudad,_,Provincia),
        alojamiento(Ciudad,Categoria,_),
        provinciaComun(Provincia),
        coeficiente(_,Coeficiente),
        capacidad(Ciudad,Categoria,CapacidadAlojamiento),
        Fondos is (CapacidadAlojamiento*10*Coeficiente).

