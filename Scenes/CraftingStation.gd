extends Control

class_name CraftingStation

@onready var player = get_parent().get_node("Player")
#The cauldron slots
@onready var ingredient1#: = $Sprite2D/VBoxContainer/HBoxContainer3/IngredientDisplayPanel
@onready var ingredient2#: = $Sprite2D/VBoxContainer/HBoxContainer3/IngredientDisplayPanel2
@onready var ingredient3#: = $Sprite2D/VBoxContainer/HBoxContainer3/IngredientDisplayPanel3
@onready var craft#: Button = $Craft
@onready var cancel#: Button = $Cancel
@onready var ingredientUsed#: Array = [ingredient1, ingredient2, ingredient3]

var recipeFound: bool = false

#Notification Scene
@onready var craftingNotification#: Control = get_node("Notification")

#Getting the ingredients information
const CINNABAR = preload("res://Scenes/Inventory/Items/Ingredients/cinnabar.tres")
const MERCURY = preload("res://Scenes/Inventory/Items/Ingredients/mercury.tres")
const SALT = preload("res://Scenes/Inventory/Items/Ingredients/salt.tres")
const SOUL = preload("res://Scenes/Inventory/Items/Ingredients/soul.tres")
const SULFUR = preload("res://Scenes/Inventory/Items/Ingredients/sulfur.tres")

#Getting Potion information
@export var ingredients_legend: Array[InvItem] = [CINNABAR,MERCURY,SALT,SOUL,SULFUR]

var recipes : = {}

#RecipeNames
#var recipeNames: Array = ["Rage Potion", "Slime Potion", "Health Potion"]
#
#var recipeNameToItem: Dictionary = {"Rage Potion": ragePotion, "Slime Potion": slimePotion, "Health Potion": healthPotion}
#var recipes = [ragePot, slimePot, healthPot]

#var ingredientList: Dictionary = {"Cinnabar": 0, "Mercury": 0, "Salt": 0, "Soul": 0, "Sulfur": 0}

# Called when the node enters the scene tree for the first time.
#func _ready():
	#prep_crafting()

func set_ui_elements(ing1, ing2, ing3, craftButton, cancelButton, notifNode):
	ingredient1 = ing1
	ingredient2 = ing2
	ingredient3 = ing3
	craft = craftButton
	cancel = cancelButton
	craftingNotification = notifNode
	ingredientUsed = [ingredient1, ingredient2, ingredient3]
	

func prep_crafting():
	craftingNotification.visible = false
	ingredient1.item_added.connect(_on_item_added)
	ingredient2.item_added.connect(_on_item_added)
	ingredient3.item_added.connect(_on_item_added)


func _on_item_added():
	handleButtonVisibility()

func handleButtonVisibility():
	craft.visible = ingredient_slots_filled()
	cancel.visible = any_ingredient_slots_filled()

func ingredient_slots_filled() -> bool:
	for ingredient in ingredientUsed:
		if not ingredient.item:
			return false
	return true

func any_ingredient_slots_filled() -> bool:
	for ingredient in ingredientUsed:
		if ingredient.item:
			return true
	return false

func _on_cancel_pressed():
	for ingredient in ingredientUsed:
		ingredient.set_item(null)
		#ingredient.has_item = false
		#ingredient.clear_texture()
	handleButtonVisibility()

func update_and_pop_crafting_notification(created):
	craftingNotification.visible = true
	craftingNotification.get_node("MarginContainer").get_node("VBoxContainer").get_node("Label").text = created.name
	craftingNotification.get_node("MarginContainer").get_node("VBoxContainer").get_node("Image").texture = created.texture

func _on_craft_pressed():
	var valid = false
	var ingredients : = [ingredient1.item, ingredient2.item, ingredient3.item]
	for recipe in recipes.keys():
		if recipe == ingredients:
			valid = true
			print_debug("Valid ingredient combination for: '{result}'".format({'result':recipes[recipe].name}))
			# TODO Find a way to determine whether to insert into potion inventory or tower inventory
			player.potion_inv.insert(recipes[recipe])
			update_and_pop_crafting_notification(recipes[recipe])
			# TODO - subtract from inventory
	if not valid:
		print_debug("Invalid ingredient combination")
	for ingredient in ingredientUsed:
		#ingredient.item = null
		ingredient.set_item(null)
	handleButtonVisibility()
