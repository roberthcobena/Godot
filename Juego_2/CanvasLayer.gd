extends CanvasLayer

signal use_move_vector

func _input(event):
	if event is InputEventScreenTouch or event is InputEventScreenDrag:
		if $TouchScreenButton.is_pressed():
			var move_vector = calculate_move_vector(event.position)
			emit_signal("use_move_vector", move_vector)
			
func calculate_move_vector(event_position):
	var texture_center = $TouchScreenButton.position + Vector2(256,256)
	return (event_position - texture_center). normalized()
	
func _on_CanvasLayer_use_move_vector(move_vector):
	
