extends Node2D

class_name Pipes

signal complete

func _process(delta):
	position.x -= Global.speed * delta

func spawn():
	var pos = get_viewport().get_camera_2d().get_global_position()
	var viewport_rect = get_viewport().get_camera_2d().get_viewport_rect()
	
#	position = pos
	
	if Global.direction == "to_right":
		position.x = pos.x + 515
	if Global.direction == "to_left":
		position.x = pos.x - 15
	
	get_node('TopPipe').position.y -= Global.span / 2
	get_node('BottomPipe').position.y += Global.span / 2 
	
	position.y = randf_range(viewport_rect.size.y * 0.3, viewport_rect.size.y * 0.6)
  

func _on_complete_body_entered(body):
	complete.emit()


#func _on_visible_on_screen_enabler_2d_screen_exited():
#	queue_free()
