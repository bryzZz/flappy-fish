extends Node2D

class_name Ground

@onready var ground = $Ground as StaticBody2D
@onready var sprite = $Ground/Sprite2D as Sprite2D
var speed = 0
var ground2
var sprite_width


func _ready():
	sprite_width = sprite.texture.get_width() * sprite.scale.x
	ground2 = ground.duplicate() as StaticBody2D
	ground2.name = "Ground2"
	ground2.global_position.x = ground.global_position.x + sprite_width
	
	add_child(ground2)


func _process(delta):
	ground.global_position.x -= speed * delta
	ground2.global_position.x -= speed * delta
	
	if ground.global_position.x < -sprite_width:
		ground.global_position.x = ground2.global_position.x + sprite_width
	
	if ground2.global_position.x < -sprite_width:
		ground2.global_position.x = ground.global_position.x + sprite_width


func stop():
	speed = 0










