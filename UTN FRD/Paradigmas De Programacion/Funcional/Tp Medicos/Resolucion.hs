import Data.List

data Medico = UnMedico {
    nombre :: String,
    edad :: Int,
    especialidades:: [Especialidad]
} deriving(Show,Eq)


data Especialidad = UnaEspecialidad{
    nombreEsp :: String,
    anios :: Int,
    ocupacion :: [String]
}deriving(Show,Eq)


maria :: Medico
maria = UnMedico {
    nombre = "maria juana",
    edad = 30,
    especialidades = [UnaEspecialidad "Ginecologia" 5 ["Salud"], UnaEspecialidad "Obstetricia" 2 ["Embarazo", "Parto"]]
}

pepe :: Medico
pepe = UnMedico {
    nombre = "Leopoldo",
    edad = 50,
    especialidades = [UnaEspecialidad "Cirujano" 3 ["Operaciones"],UnaEspecialidad "Ginecologia" 1 ["Salud"], UnaEspecialidad "Oncologia" 1 ["Salud"]]
}

listaEspecialidades :: [String]
listaEspecialidades = ["Ginecologia","Cirujano","Obstetricia","Pediatra"] 
todosLosMedicos :: [Medico]
todosLosMedicos = [maria,pepe]

-----------------------Saber de que especialidad no hay medicos------------------
especialidadesDe :: Medico -> [String]
especialidadesDe medico = map nombreEsp (especialidades medico)
especialidadesRepetidas :: Foldable t => t Medico -> [String]
especialidadesRepetidas todosLosMedicos = concatMap especialidadesDe todosLosMedicos

especialidadesQueHayMedicos :: [String]
especialidadesQueHayMedicos = nub (especialidadesRepetidas todosLosMedicos)

especialiades :: [Medico] -> [[Especialidad]]
especialiades medico = map especialidades medico 

noHayMedicos :: [String]
noHayMedicos =  listaEspecialidades \\ especialidadesQueHayMedicos 

---------------Saber Que Medico Tiene mas de una especialidad--------------------------

masDeUnaEspecialidad :: Medico -> Bool
masDeUnaEspecialidad medico = length(especialidades medico) > 1

medicosConMasDeUnaEspecialidad :: [Medico]
medicosConMasDeUnaEspecialidad  = filter (masDeUnaEspecialidad) (todosLosMedicos)

nombreDeMedicosConMasDeUnaEspecialidad :: [String]
nombreDeMedicosConMasDeUnaEspecialidad = map nombre medicosConMasDeUnaEspecialidad 

---------------medicos estudian una especialidad----------------------------------

estudiarNuevaEspecialidad :: String -> String -> Medico -> Medico
estudiarNuevaEspecialidad nombreEspecialidad ocupacionEspecialidad medico = medico {especialidades = especialidades medico ++ [UnaEspecialidad nombreEspecialidad 0 [ocupacionEspecialidad]]}

-----------------Juicio por mala praxis-------------------
recibeJuicio :: Medico -> Medico
recibeJuicio medico = medico {especialidades = []}

----------------Cumpleaños------------------
aumentarExperiencia :: Especialidad -> Especialidad
aumentarExperiencia especialidad = especialidad {anios = anios especialidad + 1}
cumpleañosDe medico = medico {especialidades = map (aumentarExperiencia) (especialidades medico), edad = edad medico + 1}

------------------ Ultima Parte ------------------------------
esOncologo :: Medico -> Bool
esOncologo medico = elem "Oncologia" (especialidadesDe medico)
medicosOncologos :: [Medico]
medicosOncologos = filter esOncologo todosLosMedicos
oncologosEstudianGerontologia :: [Medico]
oncologosEstudianGerontologia = map (estudiarNuevaEspecialidad "Geontologia" "Salud") medicosOncologos

-----------------Mala praxis leopoldo--------------
seLlamaLeopoldo :: Medico -> Bool
seLlamaLeopoldo medico = (nombre medico == "Leopoldo")
todosLosLeopoldos :: [Medico]
todosLosLeopoldos = filter seLlamaLeopoldo todosLosMedicos
malaPraxisLeopoldo :: [Medico]
malaPraxisLeopoldo = map recibeJuicio todosLosLeopoldos

----------------Los de 65 Cumplen años--------------
tiene65Años :: Medico -> Bool
tiene65Años medico = (edad medico == 65)
todosLosDe65 :: [Medico]
todosLosDe65 = filter tiene65Años todosLosMedicos
cumplenAñoLosDe65 :: [Medico]
cumplenAñoLosDe65 = map cumpleañosDe todosLosDe65

-----------------------Cambio de nombre--------------
cambioDeNombre :: String -> Medico -> Medico
cambioDeNombre nombreNuevo medico = medico{nombre = nombreNuevo} 
medicosConMasDeUnaEspecialidadCambianDeNombreA :: String -> [Medico]
medicosConMasDeUnaEspecialidadCambianDeNombreA nombreNuevo = map (cambioDeNombre nombreNuevo) medicosConMasDeUnaEspecialidad  

---------------Agrego uno, si se llama maria es nutricionista---------------------
seLlamaMaria :: Medico -> Bool
seLlamaMaria medico = (nombre medico == "Maria")
todasLasMarias :: [Medico]
todasLasMarias = filter seLlamaLeopoldo todosLosMedicos
mariasNutricionistas :: [Medico]
mariasNutricionistas = map (estudiarNuevaEspecialidad "Nutricion" "Salud") todasLasMarias