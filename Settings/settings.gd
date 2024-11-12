extends Control

@onready var clicked_button: AudioStreamPlayer = $ClickedButton
@onready var max_points: TextEdit = $VBoxContainer/VBoxContainer/HBoxContainer/MaxPoints
@onready var point_check: CheckBox = $VBoxContainer/VBoxContainer/HBoxContainer/PointCheck
@onready var time_limit: TextEdit = $VBoxContainer/VBoxContainer/HBoxContainer/TimeLimit
@onready var time_check: CheckBox = $VBoxContainer/VBoxContainer/HBoxContainer/TimeCheck

var pointcheck: bool = false
var timelimit: bool = false

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	pass

func _on_return_button_pressed() -> void:
	clicked_button.play()
	GameManagement.maxpoint = int(max_points.text)
	GameManagement.timelimit = int(time_limit.text)
	if pointcheck == true && timelimit == false:
		GameManagement.timecheck = false
		GameManagement.pointcheck = true
	elif pointcheck == false && timelimit == true:
		GameManagement.timecheck = true
		GameManagement.pointcheck = false
	else:
		return
	get_tree().change_scene_to_file("res://Main_menu/main_menu.tscn")

func _on_point_check_pressed() -> void:
	pointcheck = true
	timelimit = false

func _on_time_check_pressed() -> void:
	pointcheck = false
	timelimit = true
