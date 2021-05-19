import extras.*
import wollok.game.*
import comidas.*

object pepita {
	
	// Los objetos tienen que saber decirnos 2 cosas:
	// - image: la imagen que les corresponde para mostrar en pantalla
	// -position: la ubicación en la pantalla en coordenadas X e Y
	var property nivelActual 
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
		return game.hasVisual(silvestre) and self.position() == silvestre.position()
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

	// Esto ya no se usa, queda por temas didácticos, sino se berraría
	method comeComidaDebajo() {
		const objetosDebajo = game.colliders(self)
		if (!objetosDebajo.isEmpty()) {
			const comida = objetosDebajo.head()	
			self.validarQueEsComida(comida)
			self.comerYRemover(comida) 
		}
	}
	
	method comerYRemover(comida) {		
		self.come(comida)
		gestorDeComidas.removerComida(comida)
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
	
	method validarQueEsComida(posibleComida) {
		if (not gestorDeComidas.existeComida(posibleComida)) {
			self.error("Esto no es una comida")
		}
	}
	
	method pasarDeNivel() {
		nivelActual.terminar()
	}

}

