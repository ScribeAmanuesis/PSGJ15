extends StaticBody2D

@export var cooldown : = 1.0
@export var targeting_order : TARGETING = TARGETING.FIRST

@onready var range : = $Range
@onready var effects : = $Effects

enum TARGETING {
	FIRST,
	ALL,
	LAST,
	CLOSE,
	FAR,
	HEALTHY,
	WEAK,
	FAST,
	SLOW
}

var cooldown_timer : = 0.0

func _process(delta):
	cooldown_timer += delta
	if cooldown_timer >= cooldown and range.has_overlapping_areas():
		var targets : = get_targets()
		print(targets)
		for effect in effects.get_children():
			if effect is Effect:
				for target in targets:
					effect.activate(target)
		cooldown_timer = 0.0
		
func get_targets() -> Array:
	var areas : Array = range.get_overlapping_areas()
	match targeting_order:
		TARGETING.FIRST:
			return [areas[0]]
		TARGETING.ALL:
			return areas
		#TARGETING.LAST:
		#TARGETING.CLOSE:
		#TARGETING.FAR:
		#TARGETING.HEALTHY:
		#TARGETING.WEAK:
		#TARGETING.FAST:
		#TARGETING.SLOW:
		_:
			#By default return all
			return areas
			
