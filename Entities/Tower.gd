extends StaticBody2D

@export var cooldown : = 1.0
@onready var range : = $Range
@onready var effects : = $Effects

var cooldown_timer : = 0.0

func _process(delta):
	cooldown_timer += delta
	if cooldown_timer >= cooldown and range.has_overlapping_areas():
		##TODO: Implement some sort of ordering for targets detected in Range
		var target = range.get_overlapping_areas()[0]
		for effect in effects.get_children():
			if effect is Effect:
				effect.activate(target)
		cooldown_timer = 0.0
		

