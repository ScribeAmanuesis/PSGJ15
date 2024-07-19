extends Effect

@export var bullet_scene : PackedScene
@export var bullet_speed : = 1000.0
@export var collision_exceptions : Array[Node2D]

#func _get_configuration_warnings():
	#if bullet_scene == null:
		#return ["You gotta add a bullet to shoot"]

func activate(target: Object):
	shoot_at(target)

func shoot_at(target : Object):
	var pos : Vector2 = target.global_position
	var bullet : RigidBody2D = bullet_scene.instantiate()
	for node in collision_exceptions:
		bullet.add_collision_exception(node)
	add_sibling(bullet)
	var dir : = global_position.direction_to(pos)
	bullet.global_position = global_position + (dir * 16)
	bullet.apply_central_impulse(dir * bullet_speed) 
