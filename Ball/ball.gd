class_name Ball
extends CharacterBody2D

@export var speed := 600

@onready var collision_sound: AudioStreamPlayer = $CollisionSound

func _physics_process(delta: float) -> void:
	var collision := move_and_collide(velocity * delta)
	
	if collision:
		velocity = velocity.bounce(collision.get_normal()) * 1.05
		collision_sound.play()

func stop_moving() -> void:
	velocity = Vector2.ZERO
	
func start_moving() -> void:
	velocity.x = [-1, 1].pick_random()
	velocity.y = [-0.8, 0.8].pick_random()
	velocity = velocity * speed
