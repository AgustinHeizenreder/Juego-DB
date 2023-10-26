class Sprite{
	const imagenDerecha
	const imagenCargaDerecha
	const imagenIzquierda
	const imagenCargaIzquierda
	const imagenAtaque
	
	method imagenAtaque() = imagenAtaque
	
	method imagenSegunDireccion(unaDireccion, carga) {
		var imagen
		if(unaDireccion == 1){
			 if(carga){imagen = imagenCargaDerecha} else{imagen = imagenDerecha}
		}
		else{
			if(carga){imagen = imagenCargaIzquierda} else{imagen = imagenIzquierda}
		}
		return imagen
	}
	
}

const muerto = new Sprite(imagenDerecha = "fantasmaDerecha.png", imagenIzquierda = "fantasma.png", imagenCargaIzquierda = null, imagenCargaDerecha = null, imagenAtaque = null)
const goku = new Sprite(imagenDerecha = "goku.png", imagenCargaDerecha = "gokuCargaDercha.png", imagenIzquierda = "gokuIzquierda.png", imagenCargaIzquierda = "gokuCargaIzquierda", imagenAtaque = "ataque.png")
const vegeta = new Sprite(imagenDerecha = "vegetaDerecha.png", imagenCargaDerecha = "vegetaCargaDerecha.png", imagenIzquierda = "vegeta.png", imagenCargaIzquierda = "vegetaCargaIzquierda.png", imagenAtaque = "ataqueMalo.png")

