import Data.List(delete)
import Data.ByteString (elemIndex)
type Dinero = (Float,String)
type Moneda = String 
type Importe = Float

data Persona = UnaPersona {
    nombre :: String,
    cuenta:: [Dinero],
    nivelDeSatisfaccion :: Int
}  deriving (Show,Eq)

data Producto = UnProducto {
descripcion::String, 
precio::Importe, 
moneda::Moneda
} deriving (Show,Eq)  



cacho:: Persona
cacho = UnaPersona {
    nombre = "pedro",
     cuenta = [(100, "peso"), (1, "dolar"), (400, "real")],
     nivelDeSatisfaccion = 4
    } 

tita :: Persona
tita = UnaPersona{
    nombre = "juana",
    cuenta = [(1000, "euro"), ((-5), "peso")],
    nivelDeSatisfaccion= 2
    }

    
importe = fst 
nombreM = snd




cotizaciones :: [Dinero]
cotizaciones = [(1, "peso"), (9, "dolar"), (4, "real"), (8,"euro")]

--1) 
--a)
tipoCambio :: String -> Float
tipoCambio divisa = (importe.head.filter (\moneda -> nombreM moneda == divisa )) cotizaciones


--Sin Expresion lamda: 
--tipoCambio moneda = (fst.head.filter ((moneda==).nombreM)) cotizaciones

--b) 
convertirA :: String -> (Float, String) -> Float
convertirA obtengo (importe,tengo) = importe * tipoCambio tengo / tipoCambio obtengo 

--c) 

tieneMoneda moneda persona = any ((moneda==).nombreM) (cuenta persona)


cantidadDe moneda persona
    | tieneMoneda moneda persona = (importe.head.filter ((moneda==).nombreM)) (cuenta persona)
    | otherwise = 0

--d) 
pasarAPeso = convertirA "peso" 
totalAhorro persona = sum (map (pasarAPeso) (cuenta persona))

--Ejercicio 2 
expresadoEn producto = moneda producto


alfajor = UnProducto {
    descripcion = "poderoso el chiquitin",
    precio = 10,
    moneda = "real"
}  

gaseosa = UnProducto {
    descripcion = "refrescante",
    precio = 15,
    moneda = "dolar"
}  

libro  = UnProducto {
    descripcion = "dracula",
    precio = 15,
    moneda = "dolar"
}  
libro2  = UnProducto {
    descripcion = "1984",
    precio = 15,
    moneda = "dolar"
}  

celular = UnProducto {
    descripcion = "samsuns",
    precio = 300000,
    moneda = "pesos"
}  

celular2 = UnProducto {
    descripcion = "iphone",
    precio = 300000,
    moneda = "pesos"
}  



valorProducto = precio


comprar producto (importe,moneda)= (importe - precio producto, moneda)

vender producto (importe,moneda)= (importe + precio producto, moneda)

tieneDivisaDeProducto producto persona = head (filter ((moneda producto==).nombreM) (cuenta persona))

cantidadMoneda divisa = importe.head.filter (\moneda -> nombreM moneda == divisa)



transaccion operacion producto persona = persona {cuenta = delete (cantidadMoneda (moneda producto) (cuenta persona),moneda producto) (cuenta persona ++ map (operacion producto) (filter ((moneda producto==).nombreM) (cuenta persona)))}


--Ejercicio 3) NO ANDA
{-

type Estilo = [Producto] -> [Producto]

data Negocio = UnNegocio {
    direccion :: String,
    listaProductos :: [Producto],
    estilo :: Estilo
}

banco :: Negocio
banco = UnNegocio {
    direccion ="Medrano 900",
    listaProductos = [bici,libro],
    estilo = compulsivo
}

joya :: Negocio
joya = UnNegocio {
    direccion = "Rivadavia 4000",
    listaProductos = [bici,libro],
    estilo = exclusivo
}

-- A)

compulsivo :: Estilo
compulsivo productos = productos

impulsivo :: Estilo
impulsivo productos = [head productos]

selectivo :: Estilo
selectivo productos = filter (("peso"==).moneda) productos

irA negocio persona = (aumentarSatisfaccion.comprarSegunEstilo negocio) persona

comprarSegunEstilo (UnNegocio _ productos estilo) persona = foldl transaccion comprar (estilo productos) persona


aumentarSatisfaccion :: Persona -> Persona
aumentarSatisfaccion (UnaPersona nombre ahorros nivelSatisfaccion) = UnaPersona nombre ahorros (nivelSatisfaccion + 1)

--B)Incorporar un nuevo estilo, denominado exclusivo, por el que el cliente compra el más caro. Realizarlo utilizando la función maximum y definiendo adecuadamente el tipo de dato del producto a comprar.


instance Ord Producto where
    (<=) (UnProducto _ precio1 moneda1) (UnProducto _ precio2 moneda2) = precio1*tipoCambio moneda1 <= precio2*tipoCambio moneda2


exclusivo :: Estilo
exclusivo productos = [maximum productos] -}