extends Node

@onready var player = $Player as Player
@onready var pipe_spawner = $PipeSpawner as PipeSpawner
@onready var ground = $Ground as Ground
@onready var ui = $UI as UI

@export var speed = 300

var points = 0

func _ready():
	player.hit.connect(end_game)
	player.start_game.connect(on_start_game)
	pipe_spawner.complete.connect(on_point_scored)

func on_start_game():
	ground.speed = speed
	pipe_spawner.speed = speed
	
	pipe_spawner.start()

func end_game():
	player.stop()
	ground.stop()
	pipe_spawner.stop()
	ui.on_game_over()

func on_point_scored():
	print('here', points)
	points += 1
	ui.update_points(points)
