import pepita.*
import comidas.*
import extras.*
import wollok.game.*

object nivel {

	method iniciar() {
		game.addVisual(new Manzana(position = game.at(1, 8)))
		game.addVisual(new Manzana(position = game.at(4, 8)))
		game.addVisual(new Alpiste(peso = 70))
		game.addVisual(new Alpiste(peso = 110))
		game.addVisual(nido)
		game.addVisual(silvestre)
		game.addVisual(pepita)
		config.configurarTeclas()
		config.agregarGravedad()
		config.configurarColisiones()
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

}

