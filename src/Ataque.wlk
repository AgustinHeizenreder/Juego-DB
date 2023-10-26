import wollok.game.*
class Ataque {
	var property position 
	var imagen
	var direccion
	const property duenio
	
	method image() = imagen
	
	method esAtaque() = true
	
	method moverse(){
		if(position.x() > 32 or position.x() < 0){
			game.removeVisual(self)
		}else{
			if(direccion === 1){
				position = position.right(1) 
			}else{
				position = position.left(1)
			}
		}
	}
	
}
