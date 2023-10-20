extends Node

class_name PipeSpawner

signal complete

@onready var spawn_timer = $SpawnTimer
var pipes_scene = preload("res://scenes/pipes.tscn")

var last_pipe_spawn_position

#var current_position
#var current_pipe_spawn_position
#var current_pipe

#func _ready():
#	spawn_timer.timeout.connect(spawn_pipes)

#func _process(delta):
#	print(current_pipe_spawn_position, current_position)
#	if not current_pipe_spawn_position or not current_position:
#		return
#
#	current_position -= Global.speed * delta
	
#	print(abs(current_pipe_spawn_position - current_position))
	
#	if abs(current_pipe_spawn_position - current_position) > 500:
#		current_pipe = await spawn_pipes()
#		current_pipe_spawn_position = current_pipe.position.x
#		current_position = current_pipe.position.x

#func start():
#	current_pipe = await spawn_pipes(true)
#	current_pipe_spawn_position = current_pipe.position.x
#	current_position = current_pipe.position.x
#	spawn_timer.start()

func _process(delta):
	pass

func spawn_pipes(timeout = false):
	if timeout:
		await get_tree().create_timer(1.0).timeout
	
	var pipe = pipes_scene.instantiate()
	add_child(pipe)
	last_pipe_spawn_position = pipe.spawn().x
	
	pipe.connect('complete', on_coplete)
	
	return pipe

func on_coplete():
	complete.emit()

func stop():
	spawn_timer.stop()






