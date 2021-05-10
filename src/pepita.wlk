import extras.*
import wollok.game.*

object pepita {
	
	// Los objetos tienen que saber decirnos 2 cosas:
	// - image: la imagen que les corresponde para mostrar en pantalla
	// -position: la ubicación en la pantalla en coordenadas X e Y

	var property energia = 100
	var property position = game.origin()

	method image() {
		return if ( self.atrapada() or self.estaCansada())
			"pepita-gris.png"
		else if (self.estaEnElNido())
		 "pepita-grande.png" 
		 else "pepita.png"
	}
	
	method atrapada() {
		return self.position() == silvestre.position()
	}

	method come(comida) {
		energia = energia + comida.energiaQueOtorga()
	}

	method vola(kms) {
		self.validarEnergiaParaVolar(kms)
		energia = energia - self.energiaParaVolar(kms)
	}
	
	method energiaParaVolar(kms) {
		return kms * 9
	}

	method irA(nuevaPosicion) {
		self.vola(position.distance(nuevaPosicion))
		position = nuevaPosicion
	}
	
	method validarEnergiaParaVolar(kms) {
		if (self.energiaParaVolar(kms) > energia) {
			self.error("No tengo energia")
		}
	}

	method comeComidaDebajo() {
		const comida = game.uniqueCollider(self)
		self.come(comida)
		game.removeVisual(comida) 
	}
	
	method caerSiEstasEnElAire() {
		if (not self.estaEnElPiso()) {
			position = position.down(1) 
		}
	}


	method estaCansada() {
		return self.energiaParaVolar(1) >= energia
	}

	method estaEnElNido() {
		return position == nido.position()
	}
	
	method estaEnElPiso() {
		return position.y() == 0 
	}

}

