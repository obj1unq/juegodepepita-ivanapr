import pepita.*
import wollok.game.*
import niveles.*

object nido {

	var property position = game.at(7, 8)

	method image() = "nido.png"

	method teEncontro(ave) {
		game.say(ave, "¡GANE!")
		game.removeTickEvent("GRAVEDAD")
		game.schedule(2000, { ave.pasarDeNivel() })
	}
}

object silvestre {

	method image() {
		return "silvestre.png"
	}

	method position() {
		return game.at(pepita.position().x().max(3), 0)
	}
	 
	method teEncontro(ave) {
		game.say(ave, "¡PERDÍ!")
		game.schedule(2000, { game.stop() })
	}
}

