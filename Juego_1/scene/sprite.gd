extends Sprite

func _process(delta):
 if Input.is_action_pressed("ui_right"):
  rotation +=1*delta
  get_node("AudioStreamPlayer").play()
 if Input.is_action_pressed("ui_left"):
  rotation -=1*delta
  get_node("AudioStreamPlayer").play()
pass
