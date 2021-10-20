extends Sprite


func _process(delta):
 if Input.is_action_pressed("ui_right"):
  rotation +=1*delta 
  sonido()  
 if Input.is_action_pressed("ui_left"):
  rotation -=1*delta
pass

func sonido():
 get_tree().get_nodes_in_group("sfx")[0].get_node("rotar").play()
