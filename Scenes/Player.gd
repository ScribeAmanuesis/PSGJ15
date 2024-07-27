extends Node2D

#Enemies
var Bother = preload("res://Entities/Enemies/bother.tscn")
var Fret = preload("res://Entities/Enemies/fret.tscn")
var Woe = preload("res://Entities/Enemies/woe.tscn")
var Worry = preload("res://Entities/Enemies/worry.tscn")

# Stats
var lives : = 3
var wave : = 1 # Wave Counter for the TD Portion
var requests : = []
var shadows : Dictionary = {Bother: 0, Fret: 0, Worry: 0, Woe: 0}

# Inventories
var ingredient_inv : Inv = preload("res://Scenes/Inventory/player_ingredient_inventory.tres")
var potion_inv : Inv = preload("res://Scenes/Inventory/player_potion_inventory.tres")
var tower_inv : Inv = preload("res://Scenes/Inventory/player_tower_inventory.tres")

#region Resources
# Ingredients
const CINNABAR = preload("res://Scenes/Inventory/Items/Ingredients/cinnabar.tres")
const MERCURY = preload("res://Scenes/Inventory/Items/Ingredients/mercury.tres")
const SALT = preload("res://Scenes/Inventory/Items/Ingredients/salt.tres")
const SOUL = preload("res://Scenes/Inventory/Items/Ingredients/soul.tres")
const SULFUR = preload("res://Scenes/Inventory/Items/Ingredients/sulfur.tres")

# Potions 
const HEALTH_POTION = preload("res://Scenes/Inventory/Items/Potions/health_potion.tres")
const RAGE_POTION = preload("res://Scenes/Inventory/Items/Potions/rage_potion.tres")
const SLIME_POTION = preload("res://Scenes/Inventory/Items/Potions/slime_potion.tres")

# Tower Resources
const CAT = preload("res://Scenes/Inventory/Items/Towers/cat.tres")
const OWL = preload("res://Scenes/Inventory/Items/Towers/owl.tres")
const PIXIE = preload("res://Scenes/Inventory/Items/Towers/pixie.tres")
const SALAMANDER = preload("res://Scenes/Inventory/Items/Towers/salamander.tres")
#endregion
var ingredients_legend: Array[InvItem] = [CINNABAR,MERCURY,SALT,SOUL,SULFUR]


func add_random_ingredients():
	for i in range(10):
		ingredient_inv.insert(ingredients_legend.pick_random())

func hit():
	lives -= 1
	if lives < 1:
		gameover()
		
func gameover():
	get_tree().paused = true
	print_debug("Gameover!")
