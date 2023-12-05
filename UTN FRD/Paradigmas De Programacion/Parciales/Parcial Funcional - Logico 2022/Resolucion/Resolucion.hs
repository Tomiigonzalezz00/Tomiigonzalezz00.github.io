import Distribution.Types.Version (validVersion)
import GHCi.Message (THResultType)
data Jugador = UnJugador {
    nombre::String,
    motivacion :: String,
    habilidad :: Int
} deriving(Show,Eq)

data Video = UnVideo {
aparecen:: [String],
duracion:: Int
} deriving Show


messi = UnJugador {
    nombre = "Lionel Messi",
    motivacion = "motivado",
    habilidad = 100
}

dePaul = UnJugador {
    nombre = "Rodrigo De Paul",
    motivacion = "motivado",
    habilidad = 40
}

alvarez = UnJugador {
    nombre = "Julian Alvarez",
    motivacion = "motivado",
    habilidad = 60
}

aguero = UnJugador {
    nombre = "Sergio Aguero",
    motivacion = "desmotivado",
    habilidad = 10
}

practicaConPelota jugador 
    |motivacion jugador == "motivado" = jugador {motivacion = "desmotivado"}
    |otherwise = jugador {motivacion = "motivado"}

sumarPorcentaje habilidad parametro = habilidad + (((parametro`div`10)*habilidad)`div`100)

correrMinutos minutos jugador = jugador {habilidad = habilidad jugador + sumarPorcentaje (habilidad jugador) minutos}



-- Ejercicio 2) 

{- Videos utilizados para probar
mundial86 = UnVideo {
    aparecen=["maradona","kempes"],
    duracion = 15
}

mundial90 = UnVideo {
    aparecen=["maradona","caniggia"],
    duracion =10 
}

videos = [mundial86,mundial90]

-}

vecesQueApareceMaradona videos  = length (filter (elem "maradona") (map aparecen videos)) 
--verVideos jugador videos = 

apareceMaradona videos jugador
    |any (elem "maradona") (map aparecen videos) = jugador {habilidad = habilidad jugador + sumarPorcentaje (habilidad jugador) (vecesQueApareceMaradona videos)}
    |otherwise = jugador

minutosTotales videos = sum (map duracion videos) 

minutosVistos videos jugador  
    |minutosTotales videos > 1000 = jugador {motivacion = "motivado"}
    |otherwise = jugador {motivacion = "desmotivado"}

hayVideoExacto  = not.null.filter ((13 ==).length.aparecen).filter ((13==).duracion)

videoExacto videos jugador 
    | hayVideoExacto videos = jugador {motivacion = "desmotivado",habilidad = 0}
    |otherwise = jugador


verVideos videos = videoExacto videos.minutosVistos videos.apareceMaradona videos

{-- Si la lista fuera infinita, las acciones que requieran saber la cantidad de elementos de la lista
no se podrian realizar. En este caso, como todas lkas funciones dependen de la cantidad de videos que contengan (para sumar minutos o saber cuantas veces aparece maradona en ellos), no se podria realizar ninguna accion. Si hubiera una funcion que solo pida que el jugador vea al menos un video(es decir, que la lista de videos sea no nula) la funcion podria ser realizada aunque sea infinita
--}

--Ejercicio 3) 
--La funcion consta en que la habilidad del jugador aumentara segun la cantidad de puntos(goles) que haga en el fifa y la motivacion es desmotivado si juega call of duty y su habilidad bajara segun la cantidad de puntos(muertes)

jugarA juego jugador puntos
    |juego == "fifa" = jugador{motivacion = "motivado", habilidad = habilidad jugador + puntos} 
    |juego == "CoD" = jugador {motivacion = "desmotivado",habilidad = habilidad jugador + puntos}
--Ejercicio 4) 
--La condicion sera un indicador medido en 100 como mejor condicion y 0 como peor condicion

estaMotivado jugador 
    |motivacion jugador == "motivado" = True
    |otherwise = False



condicion jugador 
    |estaMotivado jugador && habilidad jugador >= 100 = 100
    |estaMotivado jugador && habilidad jugador >= 50  = 50 
    |estaMotivado jugador && habilidad jugador >= 0 = 10
    |otherwise = 0

--Ejercicio 5) 
--El ejercicio que lo deje en mejor condicion, sera el que lo deje con mayor habilidad final y que lo deje motivado

abdominales jugador = jugador {habilidad = habilidad jugador + 5, motivacion = "desmotivado"}

trotar jugador = jugador {habilidad = habilidad jugador + 10, motivacion = "motivado"}

ejercitar jugador ejercicio = ejercicio jugador 

resultado ejercicio1 ejercicio2 jugador  
    | condicion (ejercitar jugador ejercicio1) > condicion (ejercitar jugador ejercicio2) = ejercitar jugador ejercicio1 
    | otherwise = ejercitar jugador ejercicio2



{- Ejemplos: 
ingreso : resultado  trotar abdominales messi 
obtengo: UnJugador {nombre = "Lionel Messi", motivacion = "motivado", habilidad = 110}

ingreso resultado trotar (correrMinutos 20) alvarez
obtengo: UnJugador {nombre = "Julian Alvarez", motivacion = "motivado", habilidad = 121}
 -}