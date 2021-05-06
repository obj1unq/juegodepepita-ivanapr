import pepita.*
import wollok.game.*

object nido {

	var property position = game.at(7, 8)

	method image() = "nido.png"

	method teEncontro(ave) {
		game.stop()
	}
}

object silvestre {

	method image() {
		return "silvestre.png"
	}

	method position() {
		return game.at(pepita.position().x().max(3), 0)
	} 

}

