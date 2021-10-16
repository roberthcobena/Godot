extends "res://Scripts/State_Machine/State.gd"

func enter():
	owner.velocidad.y = -owner.v_salto
	owner.get_node("anim").play("saltando")
	owner.move_and_slide(owner.velocidad,Vector2(0,-1))
	
func update(delta):
	if owner.is_on_floor():
		emit_signal("finished","quieto")
	
	move(owner.direccion,owner.aceleracion)

func move(direccion,aceleracion):
	owner.velocidad.x = direccion.x*aceleracion
	owner.move_and_slide(owner.velocidad,Vector2(0,-1))
