extends Node2D
class_name SpeedComponent

@export var speed : = 0.5

var speed_modifier : = 1.0
var modifier_duration : = 0.0

func _process(delta):
	var parent : PathFollow2D = get_parent()
	parent.progress += speed * speed_modifier
	if modifier_duration > 0.0:
		modifier_duration -= delta
	else:
		speed_modifier = 1.0
		modifier_duration = 0.0
		
	
