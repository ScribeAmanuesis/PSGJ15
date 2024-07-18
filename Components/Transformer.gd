extends Node2D
class_name Transformer

@export var recipes : = {
	["red", "red"] : preload("res://Items/Potions/health_potion.tscn")
}

signal item_made(item)

func check_recipes(items : Array) -> Object:
	var item_ids : = []
	for item in items:
		if item is Ingredient:
			item_ids.append(item.ingredient_id)
	item_ids.sort()
	for recipe in recipes.keys():
		if recipe == item_ids:
			var transformed_item = recipes[recipe].instantiate()
			item_made.emit(transformed_item)
			return transformed_item
	return null
