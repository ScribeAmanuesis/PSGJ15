extends Control

@onready var inv: Inv = preload("res://Scenes/Inventory/player_ingredient_inventory.tres")
@onready var potion_inv: Inv = preload("res://Scenes/Inventory/player_potion_inventory.tres")
@onready var slots: Array = $PanelContainer/MarginContainer/VBoxContainer/Ingredients.get_children()
@onready var potion_slots: Array = $PanelContainer/MarginContainer/VBoxContainer/Potions.get_children()

var is_open = true

func _ready():
	#when update is emitted calls update_slots/update_potoin_slots
	inv.update.connect(update_slots)
	#potion_inv.update.connect(update_potion_slots)
	
	update_slots()
	update_potion_slots()
	open()

func _process(delta):
	if Input.is_action_just_pressed("toggle_inventory"):
		if is_open:
			close()
		else:
			open()

func update_slots():
	for i in range(min(inv.slots.size(), slots.size())):
		slots[i].update(inv.slots[i])
	
	#for i in range(min(potion_inv.slots.size(), potion_slots.size())):
		#potion_slots[i].update(potion_inv.slots[i])

func update_potion_slots():
	for i in range(min(potion_inv.slots.size(), potion_slots.size())):
		potion_slots[i].update(potion_inv.slots[i])

func open():
	visible = true
	is_open = true

func close():
	visible = false
	is_open = false