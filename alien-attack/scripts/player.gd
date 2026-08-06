extends CharacterBody2D

signal took_damage

var speed = 1000
const rcene = preload("res://scenes/rocket.tscn")

@onready var rcontainer = $RocketContainer
@onready var rocket_shot_sound = $RocketShotSound

func _physics_process(delta: float) -> void:
	velocity = Vector2(0, 0)

	if Input.is_action_pressed("move_right"):
		velocity.x = speed
	if Input.is_action_pressed("move_left"):
		velocity.x = -speed
	if Input.is_action_pressed("move_up"):
		velocity.y = -speed
	if Input.is_action_pressed("move_down"):
		velocity.y = speed

	move_and_slide()
	
	var screen_size = get_viewport_rect().size
	global_position = global_position.clamp(Vector2(0, 0), screen_size)

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("shoot"):
		shoot()

func shoot() -> void:
	var rinstance := rcene.instantiate() as Area2D
	rinstance.global_position = global_position
	rinstance.global_position.x += 60
	rcontainer.add_child(rinstance)
	rocket_shot_sound.play()

func take_damage() -> void:
	emit_signal("took_damage")

func die() -> void:
	queue_free()
