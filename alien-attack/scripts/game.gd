extends Node2D

@onready var player = $Player
@onready var hud = $UI/HUD

var lives: int = 3
var score: int = 0

func _ready():
	hud.set_score_label(score)
	hud.set_lives(lives)

func _on_deathzone_area_entered(area: Area2D) -> void:
	area.free()

func _on_player_took_damage() -> void:
	lives -= 1
	hud.set_lives(lives)
	if lives <= 0:
		print("Game Over!")
		player.remove()

func _on_enemy_spawner_enemy_spawned(enemy_instance: Variant) -> void:
	enemy_instance.connect("died", _on_enemy_died)
	add_child(enemy_instance)

func _on_enemy_died() -> void:
	score += 100
	hud.set_score_label(score)
