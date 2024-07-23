extends Node2D
class_name Player

@export var ingredients_legend: Array[InvItem] = [CINNABAR,MERCURY,SALT,SOUL,SULFUR]

var potion_inv : Inv = preload("res://Scenes/Inventory/player_potion_inventory.tres")
var ingredient_inv : Inv = preload("res://Scenes/Inventory/player_ingredient_inventory.tres")
var tower_inv : Inv

const CINNABAR = preload("res://Scenes/Inventory/Items/Ingredients/cinnabar.tres")
const MERCURY = preload("res://Scenes/Inventory/Items/Ingredients/mercury.tres")
const SALT = preload("res://Scenes/Inventory/Items/Ingredients/salt.tres")
const SOUL = preload("res://Scenes/Inventory/Items/Ingredients/soul.tres")
const SULFUR = preload("res://Scenes/Inventory/Items/Ingredients/sulfur.tres")


var ingredientNameToItem: Dictionary = {
	"Cinnabar": CINNABAR, 
	"Mercury": MERCURY, 
	"Salt": SALT, 
	"Soul": SOUL, 
	"Sulfur": SULFUR 
}

func collect(item):
	potion_inv.insert(item)

func _on_placeholder_inventory_increment_mouse_entered():
	for i in range(10):
		collect(ingredients_legend.pick_random())

func brew_potion(potion):
	for ingredient in potion.ingredients:
		potion_inv.consume(ingredientNameToItem[ingredient], potion.ingredients[ingredient])
