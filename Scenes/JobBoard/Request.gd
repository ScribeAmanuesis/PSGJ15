extends Control

var personName: String
var potion: String
var flavorText: String
var shadow: Texture2D

func _ready():
	personName = get_parent().peopleName.pick_random()
	potion = get_parent().potions.pick_random()
	flavorText = get_parent().flavorTexts[get_parent().peopleName.find(personName)]
	shadow = get_parent().shadows.pick_random()

