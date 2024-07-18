extends Node
class_name Inventory

@export var radius : = 8
@export var max_capacity : = 3
@export var held_items : = []

func can_add_item() -> bool:
	return held_items.size() <= max_capacity

func clear_items():
	for item in held_items:
		remove_item.bind(item).call_deferred()
		
func add_item(new_item : Object):
	if can_add_item():
		var item_parent = new_item.get_parent()
		if item_parent:
			item_parent.remove_child(new_item)
		add_child(new_item)
		arrange_children()
		held_items.append(new_item)
	
func arrange_children():
	var child_count : = get_child_count()
	if child_count > 1:
		var interval : = TAU / child_count
		for i in range(child_count):
			var child = get_child(i)
			child.position = Vector2.RIGHT.rotated(interval * i) * radius
	
func remove_item(item : Object):
	if held_items.has(item):
		remove_child(item)
		held_items.erase(item)
		
func pop_item() -> Object:
	if held_items.size() > 0:
		var item : Object = held_items[0]
		remove_item(item)
		return item
	return null
