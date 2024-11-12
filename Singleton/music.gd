extends Node

var music_started = false
var current_music = ""

@onready var music_player: AudioStreamPlayer = AudioStreamPlayer.new()

func _ready() -> void:
	add_child(music_player)  

func play_music(music_type: String) -> void:
	var music_file: AudioStream = null
	if music_type == "menu":
		music_file = preload("res://pong_assets/MANGOS TIKTOK VERSION (PHONK).mp3")
	elif music_type == "game":
		music_file = preload("res://pong_assets/bgmsuic.mp3")

	if not music_started or current_music != music_type:
		music_player.stream = music_file
		music_player.play()
		current_music = music_type
		music_started = true
		print("Playing: " + music_type + " music")

func stop_music():
	music_player.stop()
	music_started = false
