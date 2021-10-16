extends "res://Scripts/State_Machine/State.gd"

func enter():
	owner.get_node("anim").play("agachado")

func update(delta):
	if owner.direccion.x != 0:
		move(owner.direccion,owner.aceleracion/2)
	else:
		move(0,0)
	
	if Input.is_action_just_pressed("ui_up"):
		emit_signal("finished","saltando")

func move(direccion,aceleracion):
	owner.velocidad.x = direccion*aceleracion
	owner.move_and_slide(owner.velocidad,Vector2(0,-1))
