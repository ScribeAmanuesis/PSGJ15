extends Effect

@export var slow : = 0.1

func activate(target : Object):
	if target is CollisionComponent:	
		target.get_body().change_speed(1.0 - slow, 1.0)

