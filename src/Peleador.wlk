import wollok.game.*
import Ataque.*
import Sprites.*

class Peleador{
	var sprite
	var property position = new Position (x = 0, y = 0) 
	var direccion = 0
	var carga = false
	var energia = 100
	var vida = 100
	
	method image() = sprite.imagenSegun(direccion, carga)
	
	method derecha(){
		position = position.right(1)
		direccion = 1
		carga = false
	}
	
	method izquierda(){
		position = position.left(1)
		direccion = 0
		carga = false
	}
	
	method arriba(){
		position = position.up(1)
		carga = false
	}
	
	method abajo(){
		position = position.down(1)
		carga = false
	}
	 
	method atacar(){
		if(self.puedeAtacar()){
			game.addVisual(new Ataque(position = self.posicionAtaque(), direccion = direccion, imagen = sprite.imagenAtaque(), duenio = self))
			energia = energia - 10
		}else{
			game.say(self, "No tengo Energia")
		}
	}
	
	method puedeAtacar() {
		return energia >= 10 && vida > 0
	}
	
	method cargarEnergia(){
		energia = 100.min(energia + 5)
		carga = true
	}
	
	method esAtaque() = false
	
	method posicionAtaque(){
		if(direccion === 1){
			return position.right(1)
		}else{
			return position.left(1)
		}
	}
	
	method choco(elemento){
		if(elemento.esAtaque()){
			self.recibirDanio(elemento)
		}else{
			game.say(self, "CORRETE!!")
		}
	}
	
	method recibirDanio(ataque){
		if(ataque.duenio() !== self){
			vida -= 30
			if(vida <= 0){
				self.morir()
			}else{
				game.say(self, "Ouch, me queda" + vida.toString() + "de vida")
			}
			game.removeVisual(ataque)
		}
	}
	
	method morir(){
		sprite = muerto
		game.say(self, "Me mori :(")
	}
}