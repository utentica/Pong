extends Control

@onready var player_name_field: TextEdit = $"HBoxContainer/Player 1/VBoxContainer/PlayerNameField"
@onready var player_name_field_2: TextEdit = $"HBoxContainer/Player 2/VBoxContainer/PlayerNameField2"
@onready var clicked_button: AudioStreamPlayer = $ClickedButton

func _ready() -> void:
	Music.play_music("menu")

func _process(delta: float) -> void:
	pass

func _on_quit_button_pressed() -> void:
	clicked_button.play()
	get_tree().change_scene_to_file("res://Main_menu/main_menu.tscn")

func _on_play_button_pressed() -> void:
	clicked_button.play()
	get_tree().change_scene_to_file("res://Levels/multiplayer.tscn")
	GameManagement.player1_name = player_name_field.text
	GameManagement.player2_name = player_name_field_2.text

func _on_color_picker_button_color_changed(color: Color) -> void:
	GameManagement.color = color

func _on_color_picker_button_2_color_changed(color: Color) -> void:
	GameManagement.color2 = color
