extends Node2D

@export var path : Path2D


func spawn_wave(enemies : Array, wave : = 1):
	for enemy in enemies:
		enemy.health += wave
		path.add_child(enemy)
