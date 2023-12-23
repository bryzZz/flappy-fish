extends CanvasLayer

class_name UI
@onready var points_label = $MarginContainer/VBoxContainer/HBoxContainer/PointsLabel as Label
@onready var game_over_box = $MarginContainer/VBoxContainer/TabContainer
@onready var shop_button = $"MarginContainer/VBoxContainer/TabContainer/GameOverBox/Shop Button"
@onready var tab_container = $MarginContainer/VBoxContainer/TabContainer as TabContainer

func _ready():
	points_label.text = "0"
#	shop_button.connect("pressed", on_shop_button_pressed)

func update_points(points: int):
	points_label.text = str(points)

func on_game_over():
	game_over_box.visible = true


func _on_button_pressed():
	Global.restart()

#func on_shop_button_pressed():
#	tab_container.current_tab = 1
#
#
#func _on_back_pressed():
#	tab_container.current_tab = 0
