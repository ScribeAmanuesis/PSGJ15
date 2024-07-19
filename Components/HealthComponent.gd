extends Area2D
class_name HealthComponent

@export var health : = 10
@onready var label: = $Label

signal dead

func hit(damage : int, knockback : Vector2):
	health -= damage
	if health <= 0:
		dead.emit()
	
func _physics_process(delta):
	# The label is added as top level and forced to follow the player
	# This prevents the label turning when following the path
	label.text = "Health: " + str(health)
	label.global_position = global_position
	
	
