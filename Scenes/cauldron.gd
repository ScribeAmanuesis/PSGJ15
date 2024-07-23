extends CraftingStation

#Getting the Potion information
var healthPotion: InvItem = preload("res://Scenes/Inventory/Items/Potions/health_potion.tres")
var ragePotion: InvItem = preload("res://Scenes/Inventory/Items/Potions/rage_potion.tres")
var slimePotion: InvItem = preload("res://Scenes/Inventory/Items/Potions/slime_potion.tres")

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
		[MERCURY, SALT, SOUL] : healthPotion,
		[CINNABAR, CINNABAR, MERCURY]: ragePotion,
		[CINNABAR, MERCURY, SALT]: slimePotion ,
	}
	
	prep_crafting()
