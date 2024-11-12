extends Node

var player_score2 := 0
var opponent_score2 := 0
var ball_speed : Vector2 = Vector2.ZERO
var pc: bool = GameManagement.pointcheck
var tc: bool = GameManagement.timecheck

@onready var opponent_score: Label = $HBoxContainer/OpponentScore
@onready var player_score: Label = $HBoxContainer/PlayerScore

@onready var player_name: Label = $PlayerName
@onready var player_name_2: Label = $PlayerName2

@onready var countdown_label: Label = $CountdownLabel
@onready var countdown_timer: Timer = $CountdownTimer

@onready var ball: Ball = $Ball
@onready var score_sound: AudioStreamPlayer = $ScoreSound

@onready var unpause_button: Button = $UnpauseButton

@onready var game_time: Timer = $GameTime

func _ready() -> void:
	player_name.text = GameManagement.player1_name
	player_name_2.text = GameManagement.player2_name
	Music.play_music("game")
	if tc:
		game_time.wait_time = GameManagement.timelimit  
		game_time.start()  

func _process(_delta:float) -> void:
	countdown_label.text = str(ceil(countdown_timer.time_left))
	if Input.is_action_just_pressed("Pause"):
		if not get_tree().paused:
			pause_game()

func pause_game() -> void:
	get_tree().paused = true
	ball_speed = ball.get_velocity()
	unpause_button.visible = true

func _on_unpause_button_pressed() -> void:
	unpause_game()

func unpause_game() -> void:
	get_tree().paused = false
	ball.set_velocity(ball_speed)  
	ball.start_moving()  
	unpause_button.visible = false

func _on_countdown_timer_timeout() -> void:
	ball.start_moving()
	countdown_label.hide()

func _on_wall_left_body_entered(body: Node2D) -> void:
	body.position = get_viewport().size / 2
	opponent_score2 += 1
	opponent_score.text = str(opponent_score2)
	ball.stop_moving()
	countdown_timer.start()
	countdown_label.show()
	score_sound.play()
	check_for_winner()

func _on_wall_right_body_entered(body: Node2D) -> void:
	body.position = get_viewport().size / 2
	player_score2 += 1
	player_score.text = str(player_score2)
	ball.stop_moving()
	countdown_timer.start()
	countdown_label.show()
	score_sound.play()
	check_for_winner()
	
func check_for_winner() -> void:
	if pc:
		if player_score2 >= GameManagement.maxpoint:
			GameManagement.winner = player_name.text + " WON!" 
			get_tree().change_scene_to_file("res://Main_menu/winner_screen.tscn")
		elif opponent_score2 >= GameManagement.maxpoint:
			GameManagement.winner = "Opponent WON!"
			get_tree().change_scene_to_file("res://Main_menu/winner_screen.tscn")

func tc_winner() -> void:
	if tc:
		if player_score2 > opponent_score2:
			GameManagement.winner = player_name.text + " WON!" 
			get_tree().change_scene_to_file("res://Main_menu/winner_screen.tscn")
		elif opponent_score2 > player_score2:
			GameManagement.winner = "Opponent WON!"
			get_tree().change_scene_to_file("res://Main_menu/winner_screen.tscn")
		else:
			GameManagement.winner = "DRAW!"
			get_tree().change_scene_to_file("res://Main_menu/winner_screen.tscn")

func _on_game_time_timeout() -> void:
	tc_winner()
