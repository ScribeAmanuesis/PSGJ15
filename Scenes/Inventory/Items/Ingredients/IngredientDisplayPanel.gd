extends Panel

@onready var texture_rect = $Center/TextureRect
#var has_item : = false

var item : InvItem : 
	set = set_item

signal item_added

func set_item(new_item : InvItem):
	item = new_item
	if item == null:
		clear_texture()

#region Drag Functions
func _get_drag_data(at_position):
	var preview_texture = TextureRect.new()
	preview_texture.texture = texture_rect.texture
	preview_texture.expand_mode = 1
	preview_texture.size = Vector2(32,32)
	
	set_drag_preview(preview_texture)
	print_debug("dragged?")
	var data = item
	item = null
	return data

func _can_drop_data(_pos, data):
	return data is InvItem 

func _drop_data(_pos, data):
	print_debug("dropped?")
	texture_rect.texture = data.texture
	set_item(data)
	if data:
		item_added.emit()
	
#endregion

func clear_texture():
	texture_rect.texture = null
