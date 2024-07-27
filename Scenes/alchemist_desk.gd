extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	run_day_cycle()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#print(get_viewport().get_mouse_position())
	pass

func run_day_cycle():
	$Day_Cycle_BGM.play()
	
	Player.requests = []
