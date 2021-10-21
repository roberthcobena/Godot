extends RigidBody2D
#variables globales
export var min_speed = 150 #rango minimo de velocidad
export var max_speed = 250 #rango máximo de velocidad

#carga enemigos
func _ready():
	var mob_types = $AnimatedSprite.frames.get_animation_names()
	$AnimatedSprite.animation = mob_types[randi()%mob_types.size()]
	
#borra enemigos cuando salen de pantalla
func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
