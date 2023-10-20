extends Node

@onready var player = $Player as Player
@onready var pipe_spawner = $PipeSpawner as PipeSpawner
@onready var ground = $Ground as Ground
@onready var ui = $UI as UI

var acceleration = 1

var points = 0

func _ready():
	player.hit.connect(end_game)
	player.start_game.connect(on_start_game)
	pipe_spawner.complete.connect(on_point_scored)
	
func _physics_process(delta):
	if not Global.is_game_started:
		return
	
	Global.speed = clamp(Global.speed + acceleration, -300, 300)

func on_start_game():
#	Global.speed = 300
	Global.is_game_started = true
	acceleration = 1
	
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
	
	if points == 5:
		Global.direction = 'to_left'
		acceleration = -15  
		player.change_direction()
