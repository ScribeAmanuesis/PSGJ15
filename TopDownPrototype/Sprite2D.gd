extends Sprite2D
func _input(event):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		if get_rect().has_point(to_local(event.position)):
			print("clicked on")
			handleVisibility()

func handleVisibility():
	print(get_parent().get_parent().get_node("Details").toggle_menu(3))
	
func _ready():
	pass # Replace with function body.
