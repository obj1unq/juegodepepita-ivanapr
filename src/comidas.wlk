import wollok.game.*
import randomizer.*

object gestorDeComidas {
	const comidasEnJuego = []
	
	method agregarComidaSiRequiere() {
		if (not self.estaLlenoDeComida()) {
			self.agregarNuevaComida()
		}
	}
	
	method agregarNuevaComida() {
		const comidasPosibles = [
			self.crearManzanaAleatoria(),
			self.crearAlpisteAleatorio()
		]
		const nuevaComida = comidasPosibles.anyOne()
		self.agregarComida(nuevaComida)
	}
	
	method crearManzanaAleatoria() {
		return new Manzana(position = randomizer.emptyPosition())
	}
	
	method crearAlpisteAleatorio() {
		return new Alpiste(peso = 40.randomUpTo(100))
	}
	
	method estaLlenoDeComida() {
		return self.cantidadDeComidas() >= 3
	}
	
	method cantidadDeComidas() {
		return comidasEnJuego.size() 
	}
	
	method comidaExistente() {
		return comidasEnJuego.anyOne() 
	}
	
	method agregarComida(comida) {
		comidasEnJuego.add(comida)
		game.addVisual(comida) 
	}
	
	method removerComida(comida) {
		comidasEnJuego.remove(comida)
		game.removeVisual(comida) 
	}
	
	method existeComida(comida) {
		return comidasEnJuego.contains(comida) 
	}

}

class Manzana {
	const property position

	method image() = "manzana.png"

	method energiaQueOtorga() = 40

	// Está repetido
	method teEncontro(ave) {
		ave.comerYRemover(self)
	}
}

class Alpiste {
	const peso

	method image() = "alpiste.png"

	method position() = game.at(2, 2)

	method energiaQueOtorga() = 1 * peso

	// Está repetido
	method teEncontro(ave) {
		ave.comerYRemover(self)
	}
}

