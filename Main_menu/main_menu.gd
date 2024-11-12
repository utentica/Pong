extends Control

@onready var player_name_field: TextEdit = %PlayerNameField
@onready var clicked_button: AudioStreamPlayer = $ClickedButton

func _ready() -> void:
	Music.play_music("menu")

func _on_start_game_button_pressed() -> void:
	clicked_button.play()
	get_tree().change_scene_to_file("res://Main_menu/difficulty_menu.tscn")
	pass 

func _on_quit_button_pressed() -> void:
	clicked_button.play()
	get_tree().quit()

func _on_multiplayer_button_pressed() -> void:
	clicked_button.play()
	get_tree().change_scene_to_file("res://Main_menu/multiplayer_menu.tscn")

func _on_settings_button_pressed() -> void:
	clicked_button.play()
	get_tree().change_scene_to_file("res://Settings/settings.tscn")
