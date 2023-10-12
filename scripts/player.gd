extends CharacterBody2D

class_name Player

signal hit
signal start_game

@export var gravity = 1500.0
@export var jump_velocity = -500
@export var rotation_down_speed = 4
@export var rotation_up_speed = 10
@onready var collision_shape_2d = $CollisionShape2D as CollisionShape2D

var max_speed = 400
var is_started = false
var is_stopped = false

func _ready():
	velocity = Vector2.ZERO


func _physics_process(delta):
	if Input.is_action_just_pressed("ui_accept"):
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
	if velocity.y > 0 and rad_to_deg(rotation) < 30:
		rotation += rotation_down_speed * deg_to_rad(1)
	elif velocity.y < 0 and rad_to_deg(rotation) > -30:
		rotation -= rotation_up_speed * deg_to_rad(1)

func stop():
	collision_shape_2d.disabled = true
	is_stopped = true







