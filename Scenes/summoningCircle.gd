extends CraftingStation

#Getting the Tower information
var cat: InvItem = preload("res://Scenes/Inventory/Items/Towers/cat.tres")
var pixie: InvItem = preload("res://Scenes/Inventory/Items/Towers/pixie.tres")
var salamander: InvItem = preload("res://Scenes/Inventory/Items/Towers/salamander.tres")

const OWL = preload("res://Scenes/Inventory/Items/Towers/owl.tres")

func _ready():
	set_ui_elements(
		$Sprite2D/VBoxContainer/HBoxContainer3/IngredientDisplayPanel, 
		$Sprite2D/VBoxContainer/HBoxContainer3/IngredientDisplayPanel2, 
		$Sprite2D/VBoxContainer/HBoxContainer3/IngredientDisplayPanel3, 
		$Craft, 
		$Cancel, 
		$Notification
	)
	
	recipes = {
		[MERCURY, SALT, SOUL] : cat,
		[CINNABAR, CINNABAR, SOUL]: pixie,
		[CINNABAR, MERCURY, SOUL]: salamander,
	}
	
	prep_crafting()
