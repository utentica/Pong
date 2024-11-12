extends CharacterBody2D

@export var speed := 400
@export var ball: Node2D
var direction := 0.0

func _physics_process(delta: float) -> void:
	speed = GameManagement.speed
	velocity.x = 0
	velocity.y = get_direction() * speed
	#move_and_slide()
	move_and_collide(velocity * delta)

func get_direction() -> int:
	var deadzone := 25
	if ball.position.y - position.y < 0:
		return -1
	elif ball.position.y - position.y > 0:
		return 1
	return 0
