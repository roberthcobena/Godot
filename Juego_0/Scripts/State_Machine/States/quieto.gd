extends "res://Scripts/State_Machine/State.gd"

func enter():
	owner.get_node("anim").play("quieto")

func handle_imput(event):
	if Input.is_action_just_pressed("ui_up"):
		if owner .is_on_floor():
			owner.velocity.y = 0
			emit_signal("finished","saltando")
	
	if Input.is_action_just_pressed("ui_down"):
		emit_signal("finished","agachado")
		

func update(delta):
	if owner.direccion.x != 0:
		emit_signal("finished","corriendo")
