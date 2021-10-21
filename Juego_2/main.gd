extends Node

export (PackedScene) var Mob
var score

func _ready():
	randomize()
	new_game()
	
func game_over():
	$ScoreTimer.stop()
	$MobTimer.stop()
	
func new_game():
	score = 0
	$Player.start($StartPosition.position)
	$StartTimer.start()

func _on_StartTimer_timeout():
	$MobTimer.start()
	$ScoreTimer.start()

func _on_ScoreTimer_timeout():
	score += 1

func _on_MobTimer_timeout():
	#escoje ubicacion al azar
	$MobPath/MobSpawnLocation.offset = randi()
	#crea una instancia del enemigo y lo añade a la escena
	var mob = Mob.instace()
	add_child(mob)
	#configura la dirección perpendicular al area de juego
	var direction = $MobPath/MobSpawnLocation.rotation + PI / 2
	#configurala posicion del enemigo en un sitio al azar
	mob.position = $MobPath/MobSpawnLocation.position
	#añade algunas direcciones al azar
	mob.direction += rand_range(PI / 4, PI / 4)
	mob.rotation = direction
	#configura la velocidad
	mob.linear_velocity = Vector2(rand_range(mob.min_speed,mob.max_speed),0) 
	mob.linaer_velocity = mob.linear_velocity.rotated(direction)
