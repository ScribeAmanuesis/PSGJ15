extends RigidBody2D

@export var pierce : = 3

@onready var hit_area : = $Area2D
@onready var effects : = $Effects

var already_hit : = []

func _physics_process(delta):
	if hit_area.has_overlapping_areas():
		var areas : Array = hit_area.get_overlapping_areas()
		for area in areas:
			if already_hit.has(area):
				continue
			for effect in effects.get_children():
				if effect is Effect:
					effect.activate(area)
					already_hit.append(area)
					pierce -= 1
					if pierce <= 0:
						queue_free()
			#if area is HealthComponent:
				#area.hit(damage, global_position.direction_to(area.global_position))
				#pierce -= 1
				#already_hit.append(area)
				#if pierce <= 0:
					#queue_free()
