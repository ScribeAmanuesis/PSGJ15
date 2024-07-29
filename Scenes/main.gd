extends Node2D

@export var day: bool = true
@onready var environment = $TD.get_node("WorldEnvironment").environment
# Called when the node enters the scene tree for the first time.
func _ready():
	$TD.get_node("WorldEnvironment").environment = null



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_next_scene_pressed():
	day = not day
	load_scene(day)

func load_scene(day):
	if day:
		$TD.get_node("WorldEnvironment").environment = null
		$TD.visible = false
		$AlchemistDesk.visible = true
	else:
		$TD.get_node("WorldEnvironment").environment = environment
		$AlchemistDesk.visible = false
		$TD.visible = true
