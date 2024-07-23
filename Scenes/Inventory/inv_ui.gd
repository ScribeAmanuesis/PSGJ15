extends Control

#@onready var ingredient_inv: Inv = preload("res://Scenes/Inventory/player_ingredient_inventory.tres")
#@onready var potion_inv: Inv = preload("res://Scenes/Inventory/player_potion_inventory.tres")
#@onready var tower_inv: Inv = preload("res://Scenes/Inventory/player_tower_inventory.tres")


@onready var ingredient_inv: Inv = Player.ingredient_inv
@onready var potion_inv: Inv = Player.potion_inv
@onready var tower_inv: Inv = Player.tower_inv

@onready var ingredient_slots: Array = $PanelContainer/MarginContainer/VBoxContainer/Ingredients.get_children()
@onready var potion_slots: Array = $PanelContainer/MarginContainer/VBoxContainer/Potions.get_children()
@onready var tower_slots: Array = $PanelContainer/MarginContainer/VBoxContainer/Towers.get_children()

var is_open = true

func _ready():
	#when update is emitted calls update_slots/update_potoin_slots
	ingredient_inv.update.connect(update_slots.bind(ingredient_inv, ingredient_slots))
	potion_inv.update.connect(update_slots.bind(potion_inv, potion_slots))
	tower_inv.update.connect(update_slots.bind(tower_inv, tower_slots))
	#potion_inv.update.connect(update_potion_slots)
	
	update_slots(ingredient_inv, ingredient_slots)
	update_slots(potion_inv, potion_slots)
	update_slots(tower_inv, tower_slots)
	#update_potion_slots()
	open()

func _process(delta):
	if Input.is_action_just_pressed("toggle_inventory"):
		if is_open:
			close()
		else:
			open()

func update_slots(inv : Inv, slots : Array):
	for i in range(min(inv.slots.size(), slots.size())):
		slots[i].update(inv.slots[i])
	

#func update_potion_slots():
	#for i in range(min(potion_inv.slots.size(), potion_slots.size())):
		#potion_slots[i].update(potion_inv.slots[i])

func open():
	visible = true
	is_open = true

func close():
	visible = false
	is_open = false
