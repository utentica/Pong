extends Control

@onready var player_name_field: TextEdit = %PlayerNameField
@onready var clicked_button: AudioStreamPlayer = $ClickedButton

func _ready() -> void:
	Music.play_music("menu")

func _process(delta: float) -> void:
	pass

func _on_easy_button_pressed() -> void:
	clicked_button.play()
	get_tree().change_scene_to_file("res://Levels/level.tscn")
	GameManagement.player1_name = player_name_field.text
	GameManagement.speed = 400

func _on_medium_button_pressed() -> void:
	clicked_button.play()
	get_tree().change_scene_to_file("res://Levels/level.tscn")
	GameManagement.player1_name = player_name_field.text
	GameManagement.speed = 500

func _on_hard_button_pressed() -> void:
	clicked_button.play()
	get_tree().change_scene_to_file("res://Levels/level.tscn")
	GameManagement.player1_name = player_name_field.text
	GameManagement.speed = 650

func _on_play_button_pressed() -> void:
	clicked_button.play()
	get_tree().change_scene_to_file("res://Levels/multiplayer.tscn")

func _on_quit_button_pressed() -> void:
	clicked_button.play()
	get_tree().change_scene_to_file("res://Main_menu/main_menu.tscn")
