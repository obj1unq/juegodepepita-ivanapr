import wollok.game.*

class Manzana {
	const property position

	method image() = "manzana.png"

	method energiaQueOtorga() = 40

	method teEncontro(ave) {
		// No hace nada
	}
}

class Alpiste {
	const peso

	method image() = "alpiste.png"

	method position() = game.at(2, 2)

	method energiaQueOtorga() = 1 * peso

	method teEncontro(ave) {
		// No hace nada
	}
}

