import pepita.*
import comidas.*
import extras.*
import wollok.game.*

object nivel {

	method iniciar() {
		self.agregarObjetosIniciales()
		self.configurarMecanicas()
	}
	
	method agregarObjetosIniciales() {
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

}

object config {

	method configurarTeclas() {
		keyboard.left().onPressDo({ pepita.irA(pepita.position().left(1))})
		keyboard.right().onPressDo({ pepita.irA(pepita.position().right(1))})
		keyboard.up().onPressDo({ pepita.irA(pepita.position().up(1))})
		keyboard.down().onPressDo({ pepita.irA(pepita.position().down(1))})
		keyboard.c().onPressDo({ pepita.comeComidaDebajo() })
		
	}
	
	method agregarGravedad() {
		game.onTick(800, "GRAVEDAD", { pepita.caerSiEstasEnElAire() }) 
	}


	method configurarColisiones() {
		game.onCollideDo(pepita, { algo => algo.teEncontro(pepita) })
	}
	
	method configurarComidaAleatoria() {
		game.onTick(3000, "COMIDA", { gestorDeComidas.agregarComidaSiRequiere() })
	}

}

