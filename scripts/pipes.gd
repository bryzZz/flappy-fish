extends Node2D

class_name Pipes

signal complete

var speed = 0

func _process(delta):
	position.x -= speed * delta


func _on_complete_body_entered(body):
	complete.emit()


func _on_visible_on_screen_enabler_2d_screen_exited():
	queue_free()
