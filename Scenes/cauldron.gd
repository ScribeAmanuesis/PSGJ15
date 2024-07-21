extends Node2D

#The cauldron slots
@onready var ingredient1: TextureRect = $Ingredient
@onready var ingredient2: TextureRect = $Ingredient2
@onready var ingredient3: TextureRect = $Ingredient3
@onready var craft: Button = $Craft
@onready var cancel: Button = $Cancel
@onready var ingredientUsed: Array = [ingredient1, ingredient2, ingredient3]


var recipeLooper = 0

#Getting the ingredients information
var cinnabar: InvItem = preload("res://Entities/Inventory/Items/cinnabar.tres")
var mercury: InvItem = preload("res://Entities/Inventory/Items/mercury.tres")
var salt: InvItem = preload("res://Entities/Inventory/Items/salt.tres")
var soul: InvItem = preload("res://Entities/Inventory/Items/soul.tres")
var sulfur: InvItem = preload("res://Entities/Inventory/Items/sulfur.tres")
@export var ingredients_legend: Array[InvItem] = [cinnabar,mercury,salt,soul,sulfur]

#Recipes
var ragePotion = {"Cinnabar": 2, "Mercury": 1, "Salt": 0, "Souls": 0, "Sulfur": 0}
var slimePotion = {"Cinnabar": 1, "Mercury": 1 , "Salt": 1, "Souls": 0, "Sulfur": 0}
var healthPotion = {"Cinnabar": 0, "Mercury": 1 , "Salt": 1, "Souls": 1, "Sulfur": 0}

#RecipeNames
var recipeNames: Array = ["ragePotion", "slimePotion", "healthPotion"]
var recipes = [ragePotion, slimePotion, healthPotion]

var ingredientList: Dictionary = {"Cinnabar": 0, "Mercury": 0, "Salt": 0, "Souls": 0, "Sulfur": 0}

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	handleCraftVisibility()
	handleCancelVisibility()

func handleCancelVisibility():
	if ingredient1.texture != null or ingredient2.texture != null or ingredient3.texture != null:
		cancel.visible = true
	else:
		cancel.visible = false

func handleCraftVisibility():
	if ingredient1.texture != null and ingredient2.texture != null and ingredient3.texture != null:
		craft.visible = true
	else:
		craft.visible = false
		
#func checkRecipe(first, second, third)
#TODO
#ADD CRAFTING SYSTEM CHECKING IF VALID RECIPE THEN HAVE POPUP WITH CRAFTING IF POSSIBLE
#USE RESOURCE PATH NAME TO CHECK IF IT MATCHES RESOURCE INFORMATION?
func _on_cancel_pressed():
	print(recipes)
	ingredient1.texture = null
	ingredient2.texture = null
	ingredient3.texture = null
	


func _on_craft_pressed():
	ingredientList = {"Cinnabar": 0, "Mercury": 0, "Salt": 0, "Souls": 0, "Sulfur": 0}
	#print("texture is of type" + str(typeof(ingredient1.texture)))
	if(ingredient1.texture != null and ingredient2.texture != null and ingredient3.texture != null):
		print("player has put in 3 ingredients, checking recipe...")
		
		#put the 3 ingredients into an array
		
		for i in range(len(ingredientUsed)):
			#print(i)
			for y in range(len(ingredients_legend)):
				#print(ingredientUsed[i])
				if ingredientUsed[i].texture == ingredients_legend[y].texture:
					print("did this trigger")
					ingredientList[ingredients_legend[y].name] = ingredientList[ingredients_legend[y].name]+1
					print(ingredientList)
					
		#Recipe matching
		for i in range(len(recipes)):
			if(recipes[i] == ingredientList):
				print("recipe found!")
				print("recipe name is " + str(recipeNames[i]))
