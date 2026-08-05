extends Area2D

@export var speed: float = 250.0

func _physics_process(delta: float) -> void:
	global_position.x -= delta * speed

func remove() -> void:
	queue_free()

func _on_body_entered(body: Node2D) -> void:
	body.take_damage()
	remove()
