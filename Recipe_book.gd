extends Control

@onready var recipeName = $CenterContainer/VBoxContainer/Name
@onready var itemTexture = $CenterContainer/VBoxContainer/Item
@onready var Ing1 = $HBoxContainer/Ingredient1
@onready var Ing2 = $HBoxContainer/Ingredient2
@onready var Ing3 = $HBoxContainer/Ingredient3
@onready var potion = $Potions
@onready var familiar = $Familiars
#Getting the Potion information
var healthPotion: InvItem = preload("res://Scenes/Inventory/Items/Potions/health_potion.tres")
var ragePotion: InvItem = preload("res://Scenes/Inventory/Items/Potions/rage_potion.tres")
var slimePotion: InvItem = preload("res://Scenes/Inventory/Items/Potions/slime_potion.tres")

#Getting the ingredients information
const CINNABAR = preload("res://Scenes/Inventory/Items/Ingredients/cinnabar.tres")
const MERCURY = preload("res://Scenes/Inventory/Items/Ingredients/mercury.tres")
const SALT = preload("res://Scenes/Inventory/Items/Ingredients/salt.tres")
const SOUL = preload("res://Scenes/Inventory/Items/Ingredients/soul.tres")
const SULFUR = preload("res://Scenes/Inventory/Items/Ingredients/sulfur.tres")

var PotionRecipes = {
	[MERCURY, SALT, SOUL] : healthPotion,
	[CINNABAR, CINNABAR, MERCURY]: ragePotion,
	[CINNABAR, MERCURY, SALT]: slimePotion ,
}
var isVisible = false
var currentPotionPage: int = 0
var potionList: Array[InvItem] = [healthPotion, ragePotion, slimePotion]

var isPotionPage: bool = true

var cat: InvItem = preload("res://Scenes/Inventory/Items/Towers/cat.tres")
#var owl: InvItem = preload("res://Scenes/Inventory/Items/Towers/owl.tres")
var pixie: InvItem = preload("res://Scenes/Inventory/Items/Towers/pixie.tres")
var salamander: InvItem = preload("res://Scenes/Inventory/Items/Towers/salamander.tres")

var FamiliarRecipes = {
	[MERCURY, MERCURY, SOUL] : cat,
	[CINNABAR, SALT, SOUL]: pixie ,
	[SULFUR, SULFUR, SULFUR]: salamander
}

var currentFamiliarPage: int = 0
var familiarList: Array[InvItem] = [cat, pixie, salamander]

func set_ui_elements(name, item_tex, ing1, ing2, ing3):
	recipeName.text = name
	itemTexture.texture = item_tex
	Ing1.texture = ing1
	Ing2.texture = ing2
	Ing3.texture = ing3
	
func _ready():
	set_ui_elements(healthPotion.name, healthPotion.texture, MERCURY.texture, SALT.texture, SOUL.texture)
	isPotionPage = true
	currentPotionPage = 1
	currentFamiliarPage = 1

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _input(event):
	if event.is_action_pressed("open_recipe_book"):
		isVisible = !isVisible
		checkVisibility()

func checkVisibility():
	if !isVisible:
		hide()
	elif isVisible:
		show()


func _on_next_pressed():
	if isPotionPage:
		#if going next page is not possible
		currentPotionPage += 1
		if currentPotionPage > potionList.size():
			currentPotionPage = 1
		
		var currentPotion = potionList[currentPotionPage - 1]
		var ingredients = PotionRecipes.find_key(currentPotion)
		set_ui_elements(currentPotion.name, currentPotion.texture, ingredients[0].texture, ingredients[1].texture, ingredients[2].texture)
		
	if !isPotionPage:
		currentFamiliarPage += 1
		if currentFamiliarPage > familiarList.size():
			currentFamiliarPage = 1
		
		var currentFamiliar = familiarList[currentFamiliarPage - 1]
		var ingredients = FamiliarRecipes.find_key(currentFamiliar)
		set_ui_elements(currentFamiliar.name, currentFamiliar.texture, ingredients[0].texture, ingredients[1].texture, ingredients[2].texture)
		
	


func _on_previous_pressed():
	if isPotionPage:
		#if going next page is not possible
		currentPotionPage -= 1
		if currentPotionPage < 1:
			currentPotionPage = potionList.size()
		
		var currentPotion = potionList[currentPotionPage - 1]
		var ingredients = PotionRecipes.find_key(currentPotion)
		set_ui_elements(currentPotion.name, currentPotion.texture, ingredients[0].texture, ingredients[1].texture, ingredients[2].texture)
		
	if !isPotionPage:
		currentFamiliarPage -= 1
		if currentFamiliarPage < 1:
			currentFamiliarPage = familiarList.size()
		
		var currentFamiliar = familiarList[currentFamiliarPage - 1]
		var ingredients = FamiliarRecipes.find_key(currentFamiliar)
		set_ui_elements(currentFamiliar.name, currentFamiliar.texture, ingredients[0].texture, ingredients[1].texture, ingredients[2].texture)


func _on_familiars_pressed():
	isPotionPage = false
	familiar.disabled = true
	potion.disabled = false
	currentFamiliarPage = 1
	var ingredients = FamiliarRecipes.find_key(familiarList[0])
	set_ui_elements(familiarList[0].name, familiarList[0].texture, ingredients[0].texture, ingredients[1].texture, ingredients[2].texture)
	


func _on_potions_pressed():
	isPotionPage = true
	potion.disabled = true
	familiar.disabled = false
	currentPotionPage = 1 
	var ingredients = PotionRecipes.find_key(potionList[0])
	print(ingredients)
	set_ui_elements(potionList[0].name, potionList[0].texture, ingredients[0].texture, ingredients[1].texture, ingredients[2].texture)



func _on_recipe_book_pressed():
	#print("pressed")
	isVisible = !isVisible
	checkVisibility()
	


func _on_close_pressed():
	isVisible = false
	checkVisibility()
