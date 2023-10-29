extends Node2D

class_name Coin

signal hit

@onready var animation_player = $AnimationPlayer
@onready var collision_shape_2d = $Area2D/CollisionShape2D

func _on_area_2d_body_entered(body):
	hit.emit()
	
	collision_shape_2d.disabled = true
	
	animation_player.play("collect")
	animation_player.connect("animation_finished", queue_free)
