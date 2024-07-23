extends Node2D


@onready var player = get_parent().get_node("Player")
#The cauldron slots
@onready var ingredient1: TextureRect = $Ingredient
@onready var ingredient2: TextureRect = $Ingredient2
@onready var ingredient3: TextureRect = $Ingredient3
@onready var craft: Button = $Craft
@onready var cancel: Button = $Cancel
@onready var ingredientUsed: Array = [ingredient1, ingredient2, ingredient3]

var recipeFound: bool = false

#Notification Scene
@onready var craftingNotification: Control = get_node("Notification")


#Getting the ingredients information
var cinnabar: InvItem = preload("res://Entities/Inventory/Items/cinnabar.tres")
var mercury: InvItem = preload("res://Entities/Inventory/Items/mercury.tres")
var salt: InvItem = preload("res://Entities/Inventory/Items/salt.tres")
var soul: InvItem = preload("res://Entities/Inventory/Items/soul.tres")
var sulfur: InvItem = preload("res://Entities/Inventory/Items/sulfur.tres")

#Getting Potion information

@export var ingredients_legend: Array[InvItem] = [cinnabar,mercury,salt,soul,sulfur]


#Getting the Potion information
var healthPotion: InvItem = preload("res://Entities/Inventory/Items/Potions/health_potion.tres")
var ragePotion: InvItem = preload("res://Entities/Inventory/Items/Potions/rage_potion.tres")
var slimePotion: InvItem = preload("res://Entities/Inventory/Items/Potions/slime_potion.tres")

#Recipes
var ragePot = {"Cinnabar": 2, "Mercury": 1, "Salt": 0, "Soul": 0, "Sulfur": 0}
var slimePot = {"Cinnabar": 1, "Mercury": 1 , "Salt": 1, "Soul": 0, "Sulfur": 0}
var healthPot = {"Cinnabar": 0, "Mercury": 1 , "Salt": 1, "Soul": 1, "Sulfur": 0}

#RecipeNames
var recipeNames: Array = ["Rage Potion", "Slime Potion", "Health Potion"]

var recipeNameToItem: Dictionary = {"Rage Potion": ragePotion, "Slime Potion": slimePotion, "Health Potion": healthPotion}
var recipes = [ragePot, slimePot, healthPot]

var ingredientList: Dictionary = {"Cinnabar": 0, "Mercury": 0, "Salt": 0, "Soul": 0, "Sulfur": 0}

# Called when the node enters the scene tree for the first time.
func _ready():
	craftingNotification.visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	handleCraftVisibility()
	handleCancelVisibility()

#handle cancel button visibility
func handleCancelVisibility():
	if ingredient1.texture != null or ingredient2.texture != null or ingredient3.texture != null:
		cancel.visible = true
	else:
		cancel.visible = false

#handle craft button visibility
func handleCraftVisibility():
	if ingredient1.texture != null and ingredient2.texture != null and ingredient3.texture != null:
		craft.visible = true
	else:
		craft.visible = false


func _on_cancel_pressed():
	print(recipes)
	ingredient1.texture = null
	ingredient2.texture = null
	ingredient3.texture = null
	
#TODO
#add interation with player inventory
func _on_craft_pressed():
	ingredientList = {"Cinnabar": 0, "Mercury": 0, "Salt": 0, "Soul": 0, "Sulfur": 0}
	#print("texture is of type" + str(typeof(ingredient1.texture)))
	if(ingredient1.texture != null and ingredient2.texture != null and ingredient3.texture != null):
		
		#put the 3 ingredients into an array
		
		for i in range(len(ingredientUsed)):
			#print(i)
			for y in range(len(ingredients_legend)):
				#print(ingredientUsed[i])
				if ingredientUsed[i].texture == ingredients_legend[y].texture:
					ingredientList[ingredients_legend[y].name] = ingredientList[ingredients_legend[y].name]+1
					print(ingredientList)
					
		#Recipe matching
		for i in range(len(recipes)):
			if(recipes[i] == ingredientList):
				recipeFound = true
				craftingNotification.get_node("Panel").get_node("Potion").texture = recipeNameToItem[recipeNames[i]].texture
				craftingNotification.visible = true
				if(player != null):
					player.brew_potion(recipeNameToItem[recipeNames[i]])
				
				ingredient1.texture = null
				ingredient2.texture = null
				ingredient3.texture = null
