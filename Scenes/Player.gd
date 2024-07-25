extends Node2D

# Stats
var wave : = 1 # Wave Counter for the TD Portion
var requests : = []
var shadows : = []

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


#var ingredientNameToItem: Dictionary = {
	#"Cinnabar": CINNABAR, 
	#"Mercury": MERCURY, 
	#"Salt": SALT, 
	#"Soul": SOUL, 
	#"Sulfur": SULFUR 
#}
#
#func collect(item):
	#ingredient_inv.insert(item)

func add_random_ingredients():
	for i in range(10):
		ingredient_inv.insert(ingredients_legend.pick_random())

#func brew_potion(potion):
	#for ingredient in potion.ingredients:
		#potion_inv.consume(ingredientNameToItem[ingredient], potion.ingredients[ingredient])
		
#func generate_requests(): NOT CURRENTLY IN USE
	#pass
	
#func generate_shadows(): NOT CURRENTLY IN USE
	#pass
