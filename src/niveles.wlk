import pepita.*
import comidas.*
import extras.*
import wollok.game.*

object nivelInicial {

	method iniciar() {
		pepita.nivelActual(self)
		self.agregarObjetosIniciales()
		self.configurarMecanicas()
	}

	method agregarObjetosIniciales() {
		game.addVisual(nido)
		game.addVisual(pepita)
		gestorDeComidas.agregarComida(new Alpiste(peso = 100))
		gestorDeComidas.agregarComida(new Manzana(position = pepita.position().right(1)))
	}

	method configurarMecanicas() {
		config.configurarTeclas()
		config.agregarGravedad()
		config.configurarColisiones()
	}

	method terminar() {
		game.clear()
		nivelPosta.iniciar()
	}

}

object nivelPosta {

	method iniciar() {
		pepita.nivelActual(self)
		self.agregarObjetosIniciales()
		self.configurarMecanicas()
	}

	method agregarObjetosIniciales() {
		pepita.position(game.origin())
			// Reiniciar su energía??
		game.addVisual(nido)
		game.addVisual(silvestre)
		game.addVisual(pepita)
	}

	method configurarMecanicas() {
		config.configurarTeclas()
		config.agregarGravedad()
		config.configurarColisiones()
		config.configurarComidaAleatoria()
	}

	method terminar() {
		game.stop()
	}

}

object config {

	method configurarTeclas() {
		keyboard.left().onPressDo({ pepita.irA(pepita.position().left(1))})
		keyboard.right().onPressDo({ pepita.irA(pepita.position().right(1))})
		keyboard.up().onPressDo({ pepita.irA(pepita.position().up(1))})
		keyboard.down().onPressDo({ pepita.irA(pepita.position().down(1))})
	}

	method agregarGravedad() {
		game.onTick(800, "GRAVEDAD", { pepita.caerSiEstasEnElAire()})
	}

	method configurarColisiones() {
		game.onCollideDo(pepita, { algo => algo.teEncontro(pepita)})
	}

	method configurarComidaAleatoria() {
		game.onTick(3000, "COMIDA", { gestorDeComidas.agregarComidaSiRequiere()})
	}

}

