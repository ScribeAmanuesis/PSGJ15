extends Control

func _can_drop_data(at_position : Vector2, data : Variant) -> bool:
	return true
	
func _drop_data(at_position : Vector2, data : Variant) -> void:
	if data.get_parent():
		data.get_parent().remove_child(data)
	add_child(data)
