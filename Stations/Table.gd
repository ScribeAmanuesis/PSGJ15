extends StaticBody2D

@onready var pickup: = $Pickup
@onready var putdown: = $Putdown
@onready var inventory : = $Inventory

func _ready():
	putdown.got_item.connect(on_item_get)

func on_item_get(item):
	inventory.add_item(item)
