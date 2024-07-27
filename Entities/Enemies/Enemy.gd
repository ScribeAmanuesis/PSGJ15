extends PathFollow2D
class_name Enemy

@onready var health : = $HealthComponent
@onready var speed : = $SpeedComponent
@onready var collision : = $Collision

func _ready():
	health.dead.connect(queue_free)
	
func _process(delta):
	if progress_ratio >= 1.0:
		die()
		print_debug("end")

func hit(damage : int):
	health.hit(damage)	
	
func change_speed(modifier : float, time : = 0.0):
	speed.speed_modifier = modifier
	if time != 0.0:
		speed.modifier_duration = time

func die():
	Player.hit()
	queue_free()
