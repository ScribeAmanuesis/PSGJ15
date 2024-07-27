extends Control


func _input(event):
	if event.is_released() and event is InputEventMouseButton:
		print(event)
		
