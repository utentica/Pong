extends CharacterBody2D

@export var speed := 650.0
var direction := 0.0

func _ready() -> void:
	modulate = GameManagement.color

func _process(delta: float) -> void:
	velocity.y = direction * speed
	move_and_collide(velocity * delta)

func _unhandled_input(_event: InputEvent) -> void:
	direction = Input.get_axis("move_up2", "move_down2")
