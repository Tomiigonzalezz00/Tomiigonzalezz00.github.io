import Data.List
data Monstruo = UnMonstruo {
    nomb :: String,
    tamaño:: Float,
    peligrosidad :: Float ,
    caracteristicas :: [String]
} deriving (Show,Eq)

godzilla = UnMonstruo {
    nomb = "Godzilla",
    tamaño = 100,
    peligrosidad = 5,
    caracteristicas = ["terrestre","colmillos","coraza"]
}

sullivan = UnMonstruo {
    nomb = "Sullivan",
    tamaño = 50,
    peligrosidad = 1,
    caracteristicas = ["pelos","simpatico","bipedo"]
}

kingkong = UnMonstruo {
    nomb = "Kingkong",
    tamaño = 100,
    peligrosidad = 5,
    caracteristicas = ["pelos","colmillos","coraza"]
}



caracteristicasTerribles = ["colmillos","coraza","garra","aguijon"]
total monstruo = (tamaño monstruo* 0.2) * (2 * peligrosidad monstruo)
puntajeDeCaza monstruo 
    | puntoAdicional monstruo = total monstruo + 10
    | otherwise = total monstruo

puntoAdicional monstruo = not (null (caracteristicas monstruo `intersect` caracteristicasTerribles))

--Ejercicio 2)
data Especialidad = Acuatico 
    |Peliplumifero 
    |TodoTerreno {tope :: Float} 
    |Bipedo 
        deriving(Show,Eq)


data Cazador = UnCazador {
    nombre :: String, 
    medallasRecibidas :: Int,
    puntajeAcumulado :: Float,
    especialidad :: Especialidad
} deriving (Show,Eq)

hunter = UnCazador {
    nombre = "hunter", 
    medallasRecibidas = 1,
    puntajeAcumulado = 100,
    especialidad = Acuatico}

chasseur = UnCazador {
    nombre = "chasseur", 
    medallasRecibidas = 0,
    puntajeAcumulado = 5000,
    especialidad = TodoTerreno 50
}

hanna = UnCazador {
    nombre = "hanna", 
    medallasRecibidas = 3,
    puntajeAcumulado = 300,
    especialidad = Acuatico
}

juja = UnCazador {
    nombre = "Julieta", 
    medallasRecibidas = 3,
    puntajeAcumulado = 500,
    especialidad = TodoTerreno 80
}

juani = UnCazador {
    nombre = "Juan Ignacio", 
    medallasRecibidas = 4,
    puntajeAcumulado = 400,
    especialidad = Peliplumifero
}

tomi = UnCazador {
    nombre = "Juan Ignacio", 
    medallasRecibidas = 4,
    puntajeAcumulado = 400,
    especialidad = Bipedo
}


esAcuatico = elem "acuatico".caracteristicas

esPeliplumifero monstruo = elem "pelos" (caracteristicas monstruo) || elem "plumas" (caracteristicas monstruo)

esTodoTerreno monstruo tamañoIndicado =  (tamaño monstruo >=  tamañoIndicado) && (6 >= peligrosidad monstruo) && (peligrosidad monstruo >= 3)

esBipedo = elem "bipedo".caracteristicas

puedeCazar cazador monstruo  
    | especialidad cazador  == Acuatico = esAcuatico monstruo
    | especialidad cazador == Peliplumifero = esPeliplumifero monstruo
    | especialidad cazador == TodoTerreno {tope = tope(especialidad cazador)} = esTodoTerreno monstruo (tope (especialidad cazador))
    | especialidad cazador == Bipedo = esBipedo monstruo


monstruos = [kingkong,sullivan]
puntosObtenidos cazador   = sum.map puntajeDeCaza.filter (puedeCazar cazador) 

otorgarMedalla cazador = cazador {medallasRecibidas = medallasRecibidas cazador + 1, puntajeAcumulado = puntajeAcumulado cazador + 100}  

monstruosCazados cazador = length.filter (puedeCazar cazador)

recibeMedalla :: [Monstruo] -> Cazador -> Cazador
recibeMedalla cazados cazador
  |length cazados > 2 = otorgarMedalla cazador
  |otherwise = cazador

puntosAcumulados cazador = cazador {puntajeAcumulado = puntajeAcumulado cazador + puntosObtenidos cazador monstruos}

caceria monstruos = recibeMedalla monstruos.puntosAcumulados

