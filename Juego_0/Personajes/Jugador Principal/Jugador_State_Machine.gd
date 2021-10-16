extends "res://Scripts/State_Machine/State_machine.gd"

func _ready():
	states_map = {"saltando":$saltando,"quieto":$quieto,
			"corriendo":$corriendo,"agachado":$agachado}
	
	.set_active(true)
	change_state("quieto")

func change_state(state_name):
	.change_state(state_name)
