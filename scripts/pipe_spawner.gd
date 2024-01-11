extends Node

class_name PipeSpawner

signal complete

@onready var spawn_timer = $SpawnTimer
var pipe_variants = [preload("res://scenes/pipes1.tscn"), preload("res://scenes/pipes2.tscn")]

var last_pipe_spawn_pos
var last_pipe

#func _ready():
#	spawn_timer.timeout.connect(spawn_pipes)

func start():
	spawn_pipes(true)
#	spawn_timer.start()


func _process(delta):
	if not last_pipe_spawn_pos or not last_pipe:
		return
	
	if abs(last_pipe_spawn_pos.x - last_pipe.position.x) > 500:
		spawn_pipes()


func spawn_pipes(timeout = false):
	if timeout:
		await get_tree().create_timer(1.0).timeout
	
	var index = randi() % pipe_variants.size()
	last_pipe = pipe_variants[index].instantiate()
	add_child(last_pipe)
	last_pipe.spawn()
	last_pipe_spawn_pos = last_pipe.position
	
	last_pipe.connect('complete', on_coplete)


func on_coplete():
	complete.emit()

func stop():
	spawn_timer.stop()







