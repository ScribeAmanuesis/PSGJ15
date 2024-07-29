extends Control


func _input(event):
	if event.is_released() and event is InputEventMouseButton:
		print(event)
		


func _on_button_pressed():
	pass # Replace with function body.
