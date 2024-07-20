extends Node2D
class_name SpeedComponent

@export var SPEED : = 0.5


func _process(delta):
	var parent : PathFollow2D = get_parent()
	parent.progress += SPEED
