extends Node

@onready var player = $Control2/Player
@onready var pipe_spawner = $PipeSpawner as PipeSpawner
@onready var ground = $Ground as Ground
@onready var ui = $UI as UI
@onready var logo = $Logo as Sprite2D

var max_speed = 300
var acceleration = 1
var speed_step = 2
var span_step = 3
 
var points = 0

func _ready():
	player.hit.connect(end_game)
	player.start_game.connect(on_start_game)
	pipe_spawner.complete.connect(on_point_scored)
	
func _physics_process(delta):
	if not Global.is_game_started:
		return

	Global.speed = Global.speed + acceleration * delta
	Global.speed = clamp(Global.speed, -max_speed, max_speed)


func on_start_game():
	Global.speed = 300
	Global.is_game_started = true
	Global.span = 300
	acceleration = 1
	
	ui.start()
	
	pipe_spawner.start()

func end_game():
	Global.speed = 0
	Global.is_game_started = false
	player.stop()
	pipe_spawner.stop()
	ui.on_game_over()

func on_point_scored():
	points += 1
	ui.update_points(points)
	
	Global.span = max(100, Global.span - span_step)
	max_speed = min(max_speed + speed_step, 500)
	
#	if points == 5:
#		Global.direction = 'to_left'
#		acceleration = -15
