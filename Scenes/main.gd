extends Node2D

@export var day: bool = true

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_next_scene_pressed():
	day = not day
	load_scene(day)

func load_scene(day):
	if day:
		$TD.visible = false
		$AlchemistDesk.visible = true
	else:
		$AlchemistDesk.visible = false
		$TD.visible = true
