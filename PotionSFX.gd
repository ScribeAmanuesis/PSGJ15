extends AudioStreamPlayer2D


const INGR_DOWN : = preload("res://Assets/SFX/IngrDown.wav")
const INGR_UP : = preload("res://Assets/SFX/IngrUp.wav")
const POTION_DOWN : = preload("res://Assets/SFX/PotionDown.wav")
const POTION_UP : = preload("res://Assets/SFX/PotionUp.wav")

func _ready():
	Player.ingredient_inv.item_added.connect(play_sound.bind(INGR_UP))
	Player.ingredient_inv.item_removed.connect(play_sound.bind(INGR_DOWN))
	Player.potion_inv.item_added.connect(play_sound.bind(POTION_DOWN))
	Player.potion_inv.item_removed.connect(play_sound.bind(POTION_UP))
	
	#CraftingStation.ingredientUsed.item_added.connect(play_sound.bind(INGR_UP))


func play_sound(sound) -> void:
	stream = sound
	play()


func _on_cauldron_item_added():
	play_sound(INGR_UP)

func _on_summoning_circle_item_added():
	play_sound(INGR_UP)
