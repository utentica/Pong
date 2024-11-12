extends Control

@onready var label: Label = $VBoxContainer/Label


func _ready() -> void:
	label.text = GameManagement.winner

func _process(delta: float) -> void:
	pass

func _on_return_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Main_menu/main_menu.tscn")
