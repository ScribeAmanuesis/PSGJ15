extends Node2D

@export var path : Path2D # = get_parent().get_node("PathStart/TDPath")

func _ready():
	for shadow in Player.shadows:
		var number = Player.shadows[shadow]
		var arr = []
		for i in range(number):
			arr.append(shadow.instantiate())
		spawn_wave(arr, Player.wave)

func spawn_wave(enemies : Array, wave : = 1):
	for enemy in enemies:
		print_debug(enemy)
		#enemy.health += wave
		#path.add_child(enemy)
