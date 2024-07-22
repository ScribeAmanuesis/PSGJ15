extends CharacterBody2D

@export var inv: Inv
#@onready var slots: Array = $Entities.Inventory.Items.get_children()
#@export var ingredients : Array[Resource]
var cinnabar: InvItem = preload("res://Entities/Inventory/Items/cinnabar.tres")
var mercury: InvItem = preload("res://Entities/Inventory/Items/mercury.tres")
#var redberry: InvItem = preload("res://Entities/Inventory/Items/redberry.tres")
var salt: InvItem = preload("res://Entities/Inventory/Items/salt.tres")
var soul: InvItem = preload("res://Entities/Inventory/Items/soul.tres")
var sulfur: InvItem = preload("res://Entities/Inventory/Items/sulfur.tres")
#var vial_of_blood: InvItem = preload("res://Entities/Inventory/Items/vial_of_blood.tres")
@export var ingredients_legend: Array[InvItem] = [cinnabar,mercury,salt,soul,sulfur]

func _ready():
	#for i in ingredients_legend:
	#for i in range(10):
		#collect(ingredients_legend.pick_random())
	#collect(cinnabar)
	pass

func collect(item):
	print_debug("calling collect")
	inv.insert(item)

func _on_placeholder_inventory_increment_mouse_entered():
	for i in range(10):
		collect(ingredients_legend.pick_random())

func brew_potion(potion):
	for ingredient in potion.ingredients:
		inv.consume(ingredient)
