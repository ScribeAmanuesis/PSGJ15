extends Area2D
class_name Pickup

@export var item_scene : PackedScene
@export var infinite : = true
@export var inventory : Inventory

signal item_taken(item)

var can_pick_up: = true

func _ready():
	if infinite:
		add_child(item_scene.instantiate())

func pickup() -> Object:
	assert(infinite or inventory)
	if can_pick_up:
		var item
		if infinite:
			item = item_scene.instantiate()
		else:
			item = inventory.pop_item()
		if item != null:
			item_taken.emit(item)
			return item
	return null

