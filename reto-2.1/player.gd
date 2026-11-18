extends CharacterBody2D
# Script de movimiento del Player

@export var speed := 300.0  # R5: se cambia desde el Inspector


func _physics_process(delta: float) -> void:
	var direction := 0.0
	if Input.is_action_pressed("move_right"):
		direction += 1.0
	if Input.is_action_pressed("move_left"):
		direction -= 1.0
	velocity.x = direction * speed
	move_and_slide()
