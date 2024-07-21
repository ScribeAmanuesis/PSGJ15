extends RigidBody2D

@export var pierce : = 3
@export var ttl : = INF

@onready var hit_area : = $Area2D
@onready var effects : = $Effects

var already_hit : = []
var collision_exceptions : = []

func _physics_process(delta):
	ttl -= delta 
	if ttl < 0:
		queue_free()
	if hit_area.has_overlapping_areas():
		var areas : Array = hit_area.get_overlapping_areas()
		for area in areas:
			if already_hit.has(area) or collision_exceptions.has(area):
				continue
			for effect in effects.get_children():
				if effect is Effect:
					effect.activate(area)
					already_hit.append(area)
					pierce -= 1
					if pierce <= 0:
						queue_free()

func add_collision_exception(node : Node2D):
	collision_exceptions.append(node)
