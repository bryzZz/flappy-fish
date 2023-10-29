extends Node2D

class_name Pipes

signal complete

var coin_scene = preload("res://scenes/coin.tscn")

func _process(delta):
	position.x -= Global.speed * delta

func spawn():
	var pos = get_viewport().get_camera_2d().get_global_position()
	var viewport_rect = get_viewport().get_camera_2d().get_viewport_rect()
	
	if Global.direction == "to_right":
		position.x = viewport_rect.end.x + 100
	if Global.direction == "to_left":
		position.x = pos.x - 15
	
	get_node('TopPipe').position.y -= Global.span / 2
	get_node('BottomPipe').position.y += Global.span / 2
	
	var coin = coin_scene.instantiate() as Coin
	add_child(coin)
	coin.connect('hit', _on_coin_pickup)
	
	position.y = randf_range(viewport_rect.size.y * 0.3, viewport_rect.size.y * 0.6)
  

#func _on_complete_body_entered(body):
#	complete.emit()

func _on_coin_pickup():
	complete.emit()

#func _on_visible_on_screen_enabler_2d_screen_exited():
#	queue_free()
