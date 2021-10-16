extends "res://Scripts/State_Machine/State.gd"

func enter():
	owner.get_node("anim").play("corriendo")
	
func handle_input(event):
	return event

func update(delta):
	if owner.direccion.x == 0:
		emit_signal("finished","quieto")
	if owner.is_on_floor():
		if Input.is_action_just_pressed("ui_up"):
			owner.velocidad.y = 0
			emit_signal("finished","saltando")
			return
	
	move(owner.direccion,owner.aceleracion)

func move(direccion,aceleracion):
	owner.velocidad.x = direccion.x*aceleracion
	owner.move_and_slide(owner.velocidad,Vector2(0,-1))
