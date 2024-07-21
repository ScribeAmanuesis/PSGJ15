extends Sprite2D


func _input(event):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		if get_rect().has_point(to_local(event.position)):
			print("clicked on {this}".format({'this':get_parent().get_node("item_name").text}))
			
