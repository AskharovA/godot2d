extends Node2D

@onready var timer = $Timer

func _ready() -> void:
	timer.connect("timeout", _on_timeout)

func _on_timeout() -> void:
	print("Timeout")
