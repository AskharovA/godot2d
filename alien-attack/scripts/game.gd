extends Node2D

@onready var player = $Player

var lives: int = 3

func _on_deathzone_area_entered(area: Area2D) -> void:
	area.free()

func _on_player_took_damage() -> void:
	lives -= 1
	if lives <= 0:
		print("Game Over!")
		player.remove()
