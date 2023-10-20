extends CanvasLayer

class_name UI

@onready var points_label = $MarginContainer/PointsLabel as Label
@onready var game_over_box = $MarginContainer/GameOverBox

func _ready():
	points_label.text = "0"

func update_points(points: int):
	points_label.text = str(points)

func on_game_over():
	game_over_box.visible = true


func _on_button_pressed():
	Global.restart()
