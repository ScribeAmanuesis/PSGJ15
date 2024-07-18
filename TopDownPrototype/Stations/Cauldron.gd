extends StaticBody2D

@onready var pickup: = $Pickup
@onready var putdown: = $Putdown
@onready var transformer: = $Transformer
@onready var inventory : = $Inventory

func _ready():
	putdown.got_item.connect(on_item_get)

func on_item_get(item):
	inventory.add_item(item)
	check_transformer(item)
	
func check_transformer(item):
	var transformed_item = transformer.check_recipes(inventory.held_items)
	if transformed_item != null:
		inventory.clear_items()
		inventory.add_item(transformed_item)
	
