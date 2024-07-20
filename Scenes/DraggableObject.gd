extends TextureButton

	
func _get_drag_data(at_position : Vector2) -> Variant:
	var data : = 1
	var preview : = TextureRect.new()
	preview.texture = texture_normal
	preview.size = size / 2
	set_drag_preview(preview)
	
	return duplicate()
	
