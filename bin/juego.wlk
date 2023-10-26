import wollok.game.*
import Peleador.*
import Sprites.*

object juego {
	method inicializar(){
		game.width(32)
		game.height(18)
		game.cellSize(40)

		
		const jugador1 = new Peleador (sprite = goku, direccion = 1)
		const jugador2 = new Peleador (sprite = vegeta, position = new Position(x = 31, y = 0), direccion = 0)
		game.addVisual(jugador1)
		game.addVisual(jugador2)
		
		keyboard.a().onPressDo{ jugador1.izquierda()}
		keyboard.s().onPressDo{ jugador1.abajo()}
		keyboard.d().onPressDo{ jugador1.derecha()}
		keyboard.w().onPressDo{ jugador1.arriba()}
		keyboard.r().onPressDo{ jugador1.atacar()}
		keyboard.e().onPressDo{ jugador1.cargarEnergia()}
		
		
		keyboard.left().onPressDo{ jugador2.izquierda()}
		keyboard.down().onPressDo{ jugador2.abajo()}
		keyboard.right().onPressDo{ jugador2.derecha()}
		keyboard.up().onPressDo{ jugador2.arriba()}
		keyboard.m().onPressDo{ jugador2.atacar()}
		keyboard.k().onPressDo{ jugador2.cargarEnergia()}
		
		game.onTick(20, "Movimiento Ataques", {self.moverTodosLosAtaques()})
		
		const peleadores = game.allVisuals().filter{visual => !visual.esAtaque()}
		peleadores.forEach{peleador => game.onCollideDo(peleador, {elemento => peleador.choco(elemento)})}
	}
	
	method moverTodosLosAtaques(){
		const ataques = game.allVisuals().filter{visual => visual.esAtaque()}
		ataques.forEach{ataque => ataque.moverse()}
	}
}