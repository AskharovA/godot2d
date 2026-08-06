extends Node2D

signal enemy_spawned(enemy_instance)

@onready var timer = $Timer
@onready var spawn_positions = $SpawnPositions
const enemy_scene = preload("res://scenes/enemy.tscn")

func _ready() -> void:
	timer.connect("timeout", _on_timeout)

func _on_timeout() -> void:
	spawn_enemy()

func spawn_enemy() -> void:
	var spawn_positions_array = spawn_positions.get_children()
	var random_spawn_position = spawn_positions_array.pick_random()
	
	var enemy_instance := enemy_scene.instantiate() as Area2D
	enemy_instance.global_position = random_spawn_position.global_position
	emit_signal("enemy_spawned", enemy_instance)
