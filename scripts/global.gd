extends Node

var is_game_started = false
var speed = 300
var direction = "to_right"
var span = 300

func restart():
	is_game_started = false
	speed = 300
	direction = "to_right"
	get_tree().reload_current_scene()

func change_direction():
	direction = 'to_left'
