extends PathFollow2D
class_name Enemy

@onready var health : = $HealthComponent

func _ready():
	health.dead.connect(queue_free)
