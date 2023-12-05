class Jugadas{
	var property equipo
	var property minutoDePartido
	var property ultimoJugador 
	var property circunstanciasEspeciales = []
	
	
	
	method hizoGol(){
		if (var_.terminaEnGol(self))
		 equipo.sumarGol()
	}
	
	method sacarTarjeta(){
		ultimoJugador.recibirTarjeta()
	}
}

object var_{
	var property modoDeFuncionamiento
	
	method terminaEnGol(jugada){
		return (jugada.circunstanciasEspeciales().size() == 0) || self.modoDeFuncionamiento().golValido(jugada)
	}
	
}

object justiciaCiego{
	const circunstancias = ["la pelota no paso completamente la linea","jugador adelantado","fue con la mano"] 
	
	method golValido(unaJugada) {	
	 return unaJugada.circunstanciasEspeciales().any{unaCircunstancia => circunstancias.contains(unaCircunstancia)}
	 }
}

object fifa{
	method golValido(unaJugada) {
		return unaJugada.equipoQueAnoto().esMundialista()
	}
}

object masGoles{
	method golValido(unaJugada) {return true} 
}



class Falta inherits Jugadas {
	var property jugadorLastimado 
	var jugadorGolpeador
	var intensidad
	
override method sacarTarjeta(){
		if (intensidad > 75)
			jugadorGolpeador.recibirTarjeta()
	}
	
}

class Pelea inherits Jugadas {
	const jugadoresQueIntervienen 
	
override method sacarTarjeta(){
	if (jugadoresQueIntervienen.size() > 5 && jugadoresQueIntervienen.any({unJugador,otroJugador => unJugador.equipo() != otroJugador.equipo()}))
		jugadoresQueIntervienen.forEach{jugador => jugador.recibirTarjeta()}
	}
}

class Insulto inherits Jugadas {
	var jugadorQueInsulta
	const insultos = []
	
override method sacarTarjeta(){
	if (insultos.contains("madre"))
		jugadorQueInsulta.recibirTarjeta()
 }
}

class Festejo inherits Jugadas {
override method sacarTarjeta(){
	if(self.circunstanciasEspeciales().contains("festejo sacandose la camiseta"))
	 super()
}
}

class Partido {
	const jugadas = []
	var property equipoLocal
	var property equipoVisitante

	method cantidadDeTarjetasDe(equipo) = equipo.jugadores().sum{unJugador => unJugador.tarjetas()}


	method resultado(){
		if (equipoLocal.goles() > equipoVisitante.goles())
		return equipoLocal
		
		if (equipoVisitante.goles() > equipoLocal.goles())
		return equipoVisitante
		
		else
		return "empate"
	}
	
	method puntosPara(unEquipo){
		if (self.resultado() != "empate"){
			if (self.resultado() == unEquipo)
				return 3
			else 
			return 0 
		} 
		else 
		return 1
	}
	
	method huboMasjugadasEnSegundoTiempo(){
		return jugadas.filter{unaJugada => unaJugada.minutoDePartido() > 45}.size() > jugadas.filter{unaJugada => unaJugada.minutoDePartido() < 45}.size() 
	}
}

class Equipo {
	var property goles = 0
	var property jugadores = []
	var property esMundialista
	
	method sumarGol(){
		goles += 1
	}
}

class Jugador {
	var property tarjetas = 0
	var property equipo
	
	method recibirTarjeta(){
		tarjetas += 1
	}
}
