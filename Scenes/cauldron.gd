extends Control


@onready var player = get_parent().get_node("Player")
#The cauldron slots
@onready var ingredient1: = $Sprite2D/VBoxContainer/HBoxContainer3/IngredientDisplayPanel
@onready var ingredient2: = $Sprite2D/VBoxContainer/HBoxContainer3/IngredientDisplayPanel2
@onready var ingredient3: = $Sprite2D/VBoxContainer/HBoxContainer3/IngredientDisplayPanel3
@onready var craft: Button = $Craft
@onready var cancel: Button = $Cancel
@onready var ingredientUsed: Array = [ingredient1, ingredient2, ingredient3]

var recipeFound: bool = false

#Notification Scene
@onready var craftingNotification: Control = get_node("Notification")

#Getting the ingredients information
const CINNABAR = preload("res://Scenes/Inventory/Items/Ingredients/cinnabar.tres")
const MERCURY = preload("res://Scenes/Inventory/Items/Ingredients/mercury.tres")
const SALT = preload("res://Scenes/Inventory/Items/Ingredients/salt.tres")
const SOUL = preload("res://Scenes/Inventory/Items/Ingredients/soul.tres")
const SULFUR = preload("res://Scenes/Inventory/Items/Ingredients/sulfur.tres")

#Getting Potion information
@export var ingredients_legend: Array[InvItem] = [CINNABAR,MERCURY,SALT,SOUL,SULFUR]


#Getting the Potion information
var healthPotion: InvItem = preload("res://Scenes/Inventory/Items/Potions/health_potion.tres")
var ragePotion: InvItem = preload("res://Scenes/Inventory/Items/Potions/rage_potion.tres")
var slimePotion: InvItem = preload("res://Scenes/Inventory/Items/Potions/slime_potion.tres")

#Recipes
var ragePot = {"Cinnabar": 2, "Mercury": 1, "Salt": 0, "Soul": 0, "Sulfur": 0}
var slimePot = {"Cinnabar": 1, "Mercury": 1 , "Salt": 1, "Soul": 0, "Sulfur": 0}
var healthPot = {"Cinnabar": 0, "Mercury": 1 , "Salt": 1, "Soul": 1, "Sulfur": 0}

var recipes : = {
	[MERCURY, SALT, SOUL] : healthPotion,
	[CINNABAR, CINNABAR, MERCURY]: ragePotion,
	[CINNABAR, MERCURY, SALT]: slimePotion ,
}

#RecipeNames
#var recipeNames: Array = ["Rage Potion", "Slime Potion", "Health Potion"]
#
#var recipeNameToItem: Dictionary = {"Rage Potion": ragePotion, "Slime Potion": slimePotion, "Health Potion": healthPotion}
#var recipes = [ragePot, slimePot, healthPot]

#var ingredientList: Dictionary = {"Cinnabar": 0, "Mercury": 0, "Salt": 0, "Soul": 0, "Sulfur": 0}

# Called when the node enters the scene tree for the first time.
func _ready():
	craftingNotification.visible = false
	ingredient1.item_added.connect(_on_item_added)
	ingredient2.item_added.connect(_on_item_added)
	ingredient3.item_added.connect(_on_item_added)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
	#handleCraftVisibility()
	#handleCancelVisibility()
	
func _on_item_added():
	craft.visible = ingredient_slots_filled()
	cancel.visible = ingredient_slots_filled()

#handle cancel button visibility
func handleCancelVisibility():
	if ingredient1.texture != null or ingredient2.texture != null or ingredient3.texture != null:
		cancel.visible = true
	else:
		cancel.visible = false

#handle craft button visibility
func handleCraftVisibility():
	for ingredient in ingredientUsed:
		if not ingredient.has_item:
			craft.visible = false
			break
		else:
			craft.visible = true
	#if ingredient1.texture != null and ingredient2.texture != null and ingredient3.texture != null:
		#craft.visible = true
	#else:
		#craft.visible = false

func ingredient_slots_filled() -> bool:
	for ingredient in ingredientUsed:
		if not ingredient.has_item:
			return false
	return true

func _on_cancel_pressed():
	#print_debug(recipes)
	#ingredient1.texture = null
	#ingredient2.texture = null
	#ingredient3.texture = null
	for ingredient in ingredientUsed:
		ingredient.has_item = false
		ingredient.clear_texture()
		
		
func _on_craft_pressed():
	print("craft")
	var ingredients : = [ingredient1.item, ingredient2.item, ingredient3.item]
	for recipe in recipes.keys():
		if recipe == ingredients:
			player.potion_inv.insert(recipes[recipe])
	for ingredient in ingredientUsed:
		ingredient.item = null
##TODO
##add interation with player inventory
#func _on_craft_pressed():
	#ingredientList = {"Cinnabar": 0, "Mercury": 0, "Salt": 0, "Soul": 0, "Sulfur": 0}
	##print("texture is of type" + str(typeof(ingredient1.texture)))
	#if ingredient_slots_filled():
		##put the 3 ingredients into an array
		#for i in range(len(ingredientUsed)):
			#for y in range(len(ingredients_legend)):
				#if ingredientUsed[i].texture == ingredients_legend[y].texture:
					#ingredientList[ingredients_legend[y].name] = ingredientList[ingredients_legend[y].name]+1
					#print(ingredientList)
					#
		##Recipe matching
		#for i in range(len(recipes)):
			#if(recipes[i] == ingredientList):
				#recipeFound = true
				#craftingNotification.get_node("Panel").get_node("Potion").texture = recipeNameToItem[recipeNames[i]].texture
				#craftingNotification.visible = true
				#if(player != null):
					#player.brew_potion(recipeNameToItem[recipeNames[i]])
				#
				#ingredient1.texture = null
				#ingredient2.texture = null
				#ingredient3.texture = null
