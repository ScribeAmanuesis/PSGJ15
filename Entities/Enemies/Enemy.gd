extends PathFollow2D
class_name Enemy

@onready var health : = $HealthComponent
@onready var speed : = $SpeedComponent
@onready var collision : = $Collision

func _ready():
	health.dead.connect(queue_free)

func hit(damage : int):
	health.hit(damage)	
	
func change_speed(modifier : float, time : = 0.0):
	speed.speed_modifier = modifier
	if time != 0.0:
		speed.modifier_duration = time
