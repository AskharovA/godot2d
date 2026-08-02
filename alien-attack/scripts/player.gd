extends CharacterBody2D

var value = 500

func _physics_process(delta: float) -> void:
	velocity = Vector2(0, 0)

	if Input.is_action_pressed("move_right"):
		velocity.x = value
	if Input.is_action_pressed("move_left"):
		velocity.x = 0-value
	if Input.is_action_pressed("move_up"):
		velocity.y = 0-value
	if Input.is_action_pressed("move_down"):
		velocity.y = value

	move_and_slide()
