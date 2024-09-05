import extras.*
import wollok.game.*

object pepita {

	var property energia = 100
	var property position = game.at(0, 2) 
	var property seguidor = silvestre

	method image() {
		return if (self.estaEnElNido()) "pepita-grande.png" else "pepita.png"
	}

	method come(comida) {
		energia = 200.min(energia + comida.energiaQueOtorga())
	}

	method vola(kms) {
		energia = (energia - kms * 9).max(0)
	}

	method irA(nuevaPosicion) {
		self.vola(position.distance(nuevaPosicion))
		position = nuevaPosicion
		seguidor.position(game.at(position.x(), seguidor.position().y()))
	}

	method estaCansada() {
		return energia <= 0
	}

	method estaEnElNido() {
		
		return self.position() == nido.position()
	}

}

