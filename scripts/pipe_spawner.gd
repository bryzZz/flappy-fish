extends Node

class_name PipeSpawner

signal complete

@onready var spawn_timer = $SpawnTimer
var pipes_scene = preload("res://scenes/pipes.tscn")
var speed = 0


func _ready():
	spawn_timer.timeout.connect(spawn_pipes)

func start():
	spawn_timer.start()

func spawn_pipes():
	var pipe = pipes_scene.instantiate()
	add_child(pipe)
	
	var viewport_rect = get_viewport().get_camera_2d().get_viewport_rect()
	pipe.position.x = viewport_rect.end.x
	
	pipe.position.y = randf_range(viewport_rect.size.y * 0.3, viewport_rect.size.y * 0.6)
	pipe.speed = speed
	
	pipe.connect('complete', on_coplete)

func on_coplete():
	complete.emit()

func stop():
	spawn_timer.stop()
	for pipe in get_children().filter(func (child): return child is Pipes):
		(pipe as Pipes).speed = 0





