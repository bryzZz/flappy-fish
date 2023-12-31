extends CharacterBody2D

class_name Player

signal hit
signal start_game

@export var gravity = 1500.0
@export var jump_velocity = -500
@export var rotation_down_speed = 4
@export var rotation_up_speed = 10
@onready var collision_shape_2d = $CollisionShape2D as CollisionShape2D
@onready var sprite_2d = $Sprite2D as Sprite2D

var max_speed = 400
var is_started = false
var is_stopped = false
var direction = 'to_left'


func _physics_process(delta):
	if Input.is_action_just_pressed("jump"):
		jump()
		
	if not is_started:
		return
	
	velocity.y += gravity * delta
	velocity.limit_length(max_speed)
	
	var collision = move_and_collide(velocity * delta)
	
	if collision:
		hit.emit()
	
	rotate_player()

func jump():
	if is_stopped:
		return

	if not is_started:
		start_game.emit()
		is_started = true

	velocity.y = jump_velocity

func rotate_player():
	if Global.direction == 'to_right':
		if velocity.y > 0 and rad_to_deg(sprite_2d.rotation) < 30:
			sprite_2d.rotation += rotation_down_speed * deg_to_rad(1)
		elif velocity.y < 0 and rad_to_deg(sprite_2d.rotation) > -30:
			sprite_2d.rotation -= rotation_up_speed * deg_to_rad(1)
	else:
		if velocity.y > 0 and rad_to_deg(sprite_2d.rotation) > -30:
			sprite_2d.rotation -= rotation_down_speed * deg_to_rad(1)
		elif velocity.y < 0 and rad_to_deg(sprite_2d.rotation) < 30:
			sprite_2d.rotation += rotation_up_speed * deg_to_rad(1)

func stop():
	collision_shape_2d.disabled = true
	is_stopped = true





