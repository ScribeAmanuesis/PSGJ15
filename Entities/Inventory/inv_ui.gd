extends Control

@onready var inv: Inv = preload("res://Entities/Inventory/player_inventory.tres")
@onready var slots: Array = $ColorRect/GridContainer.get_children()

var is_open = true

func _ready():
	update_slots()
	open()

func _process(delta):
	if Input.is_action_just_pressed("toggle_inventory"):
		if is_open:
			close()
		else:
			open()

func update_slots():
	for i in range(min(inv.items.size(), slots.size())):
		slots[i].update(inv.items[i])

func open():
	visible = true
	is_open = true

func close():
	visible = false
	is_open = false