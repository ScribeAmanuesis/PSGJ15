extends Effect

@export var damage : = 1

func activate(target : Object):
	if target is HealthComponent:	
		target.hit(damage, global_position.direction_to(target.global_position))

