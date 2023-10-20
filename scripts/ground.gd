extends Node2D

class_name Ground

@onready var ground = $Ground as StaticBody2D
@onready var sprite = $Ground/Sprite2D as Sprite2D
var ground2
var sprite_width


func _ready():
	sprite_width = sprite.texture.get_width() * sprite.scale.x
	ground2 = ground.duplicate() as StaticBody2D
	ground2.global_position.x = ground.global_position.x + sprite_width
	
	ground.get_node('VisibleOnScreenNotifier2D').connect("screen_exited", on_screen_exit(0))
	ground2.get_node('VisibleOnScreenNotifier2D').connect("screen_exited", on_screen_exit(1))
	
	add_child(ground2)

func on_screen_exit(index: int):
	var inner = func():
		var first_ground = ground
		var second_ground = ground2
		if index == 1:
			first_ground = ground2
			second_ground = ground
		first_ground.position.x = second_ground.position.x + sprite_width

	return inner









