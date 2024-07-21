extends Node2D

@onready var ingredient1: TextureRect = $Ingredient
@onready var ingredient2: TextureRect = $Ingredient2
@onready var ingredient3: TextureRect = $Ingredient3
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	#print(ingredient1.texture.resource_path)
	#print(ingredient2.texture.resource_path)
	#print(ingredient3.texture.resource_path)


func _on_cancel_pressed():
	ingredient1.texture = null
	ingredient2.texture = null
	ingredient3.texture = null
	
