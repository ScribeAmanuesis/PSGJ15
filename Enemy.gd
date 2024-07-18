extends Area2D
class_name Enemy

@export var health : = 10
@onready var label: = $Label
#@onready var rigidbody : = $RigidBody2D

func hit(damage : int, knockback : Vector2):
	health -= damage
	#var tween : = create_tween().set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_QUART).set_parallel(false)
	#tween.tween_property(self, "position", knockback * damage * 10.0, 0.1)
	#tween.tween_property(self, "position", 0.0, 0.8)
	
func _physics_process(delta):
	position = lerp(position, Vector2.ZERO, 0.01)
	label.text = "Health: " + str(health)
	label.global_position = global_position
	
