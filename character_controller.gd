extends CharacterBody2D

const FRICTION : = 0.2
const SPEED : = 300.0
const JUMP_VELOCITY = -400.0

func _physics_process(delta):
	var direction : = Vector2(
		Input.get_axis("ui_left", "ui_right"),
		Input.get_axis("ui_up", "ui_down")
	)
	if direction:
		rotation = direction.angle()
		velocity = direction * SPEED
	else:
		velocity = lerp(velocity, Vector2.ZERO, FRICTION)

	move_and_slide()








