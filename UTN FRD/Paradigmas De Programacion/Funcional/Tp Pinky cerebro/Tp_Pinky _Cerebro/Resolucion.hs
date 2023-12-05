--Ejercicio 1
-- Modelo los Animales 
{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}
{-# HLINT ignore "Redundant bracket" #-}
{-# HLINT ignore "Use infix" #-}
{-# HLINT ignore "Use elem" #-}
{-# HLINT ignore "Eta reduce" #-}
import Data.List 

data Animal = Animal
    { iq :: Int,
      especie :: Especie,
      capacidades :: [String]
    } deriving(Show,Eq)


data Especie = Elefante
    | Raton 
    | Perro {raza :: String}
        deriving(Show,Eq)

--Declaro algunos animales 
pinky :: Animal
pinky = Animal {
    iq = 60,
    especie = Raton,
    capacidades = ["hablar" , "pensar"]
}

cerebro :: Animal
cerebro = Animal {
    iq = 110,
    especie = Raton,
    capacidades = ["destruir","crear","hacer asda","hacer hola","hacer pepe"]
}

elefante :: Animal
elefante = Animal {
    iq = 40,
    especie = Elefante,
    capacidades = ["beber" , "comer"]
}

raton :: Animal 
raton = Animal {
    iq = 17,
    especie = Raton,
    capacidades = ["destruenglonir el mundo","hacer planes desalmados"]

}


perro :: Animal
perro = Animal {
    iq = 10,
    especie = Perro "Pitbull",
    capacidades = ["ladrar"]
}

--Ejercicio 2 


inteligenciaSuperior :: Int-> Animal -> Animal
inteligenciaSuperior incremento animal  = animal { iq = iq animal + incremento}

pinkificar :: Animal -> Animal
pinkificar animal = animal {capacidades = []} 

darCapacidad :: Animal -> Animal
darCapacidad animal = animal{capacidades = "aprendizaje Rapido" : capacidades animal}

nuevoComienzo :: Animal -> Animal
nuevoComienzo = darCapacidad.pinkificar.inteligenciaSuperior 20

superpoderes :: Animal -> Animal
superpoderes animal 
    | (especie animal == Elefante) = animal{ capacidades = "no tiene miedo a ratones" : capacidades animal}
    | (especie animal == Raton) && (iq animal > 100) = animal{ capacidades = "hablar" : capacidades animal}
    | razaPar animal = animal { capacidades = "cazador de ratones" : capacidades animal}
    | otherwise = animal
 
razaPar :: Animal -> Bool
razaPar animal = (especie animal == Perro (raza (especie animal)) ) && (even.length)(raza (especie animal))


cambiarEspecie :: Animal -> Animal
cambiarEspecie animal 
    | (especie animal == Elefante) = animal{ especie = Raton}
    | (especie animal == Raton) = animal {especie = Perro ("Chiuahua")}
    | raza (especie animal) == "Dogo" = animal { especie = Elefante}
    | otherwise = animal {especie = Raton}

--Ejercicio 3 

antropomorfico :: Animal -> Bool
antropomorfico animal = (tieneLaHabilidad "Hablar" animal) && (iq animal > 60 )

noTanCuerdo :: Animal -> Bool
noTanCuerdo = (>= 3).length.(filter pinkiesco).capacidades

tieneLaHabilidad :: String -> Animal -> Bool
tieneLaHabilidad capacidad animal = elem capacidad (capacidades animal)

empiezaConHacer :: String -> Bool
empiezaConHacer = (== "hacer ").take 6 

habilidadSinHacer :: [a] -> [a]
habilidadSinHacer = drop 6

vocal :: Char -> Bool
vocal letra = any (letra==) "aeiou"


sinHacer :: [a] -> [a]
sinHacer = drop 6 

contieneVocal ::  [Char] -> Bool
contieneVocal = any vocal 

esPinkiesca :: [a] -> Bool
esPinkiesca = (<= 4).length.sinHacer

pinkiesco :: String -> Bool
pinkiesco habilidad = empiezaConHacer habilidad && contieneVocal (sinHacer habilidad) && esPinkiesca habilidad 


--Ejercicio 4
data Experimento = UnExperimento {
    transformacion1 :: Animal -> Animal,
    transformacion2 :: Animal -> Animal,
    transformacion3 :: Animal -> Animal,
    criterio :: Animal -> Bool
} 




experimentoExitoso experimento animal = (criterio experimento).aplicarExperimento animal


experimento1 = UnExperimento {transformacion1 = pinkificar, transformacion2 = inteligenciaSuperior 10 , transformacion3 = superpoderes, criterio = antropomorfico }
experimento2 = UnExperimento {transformacion1 = inteligenciaSuperior 20, transformacion2 = inteligenciaSuperior 10 , transformacion3 = superpoderes, criterio = noTanCuerdo }

aplicarExperimento experimento = (transformacion3 experimento).(transformacion2 experimento).(transformacion1 experimento)
--Ejercicio 5 


listaA= [perro,cerebro] --listas de prueba

listaC = ["ladrar","correr","crear","hablar","No tiene miedo a ratones","Cazador de ratones"] --lista de prueba


tieneAlguna listaCapacidades animal  = not (null(intersect (capacidades animal) listaCapacidades)) -- Para saber si tiene alguna capacidad, hago la interseccion entre las capacidades del animal y las capacidades dadas
listaConExperimento experimento = map (aplicarExperimento experimento) --Lista mapeada con el experimento aplicado 

tieneCapacidad criterio listaAnimal listaCapacidades experimento  = filter (criterio listaCapacidades) (listaConExperimento experimento listaAnimal) --identifico que animales tienen esa capacidad

reporte1 listaAnimales listaCapacidades experimento = map iq  (tieneCapacidad tieneAlguna listaAnimales listaCapacidades experimento ) --hago el primer reporte


tieneTodas listaCapacidades animal = (intersect (capacidades animal) listaCapacidades) == listaCapacidades

noTieneNinguna listaCapacidades animal = (intersect (capacidades animal) listaCapacidades) == []

reporte2 listaAnimales listaCapacidades experimento = map especie (tieneCapacidad tieneTodas listaAnimales listaCapacidades experimento)


reporte3 listaAnimales listaCapacidades experimento = map (length.capacidades) (tieneCapacidad noTieneNinguna listaAnimales listaCapacidades experimento)

-- Ejercicio 6

ratonRaro = Animal {
    iq = 100,
    especie = Raton,
    capacidades = repeat "capacidad"
    }

-- Se podrian relizar los experimentos que primero Pinkifiquen al animal, ya uqe borraria su lista infinita de capacidades, en los demas experimentos, no se lo podria usar ya que tendria un bucle infinito en las capacidades


--Ejercicio 7 
abecedario = subsequences ['a'..'z']
generateWordsUpTo largo = filter ((<= largo).length) (abecedario)

generateWords largo = filter ((== largo).length) (abecedario)

pinkiescasPosibles largo criterio = filter (contieneVocal) (criterio largo)




