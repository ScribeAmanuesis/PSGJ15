extends TextureButton

var personName: String
var potionName: String
var flavorText: String
var shadow: Texture2D
#var currentNodeName:String

@onready var parent : = get_parent().get_parent()

func _ready():
	personName = parent.peopleName.pick_random()
	potionName = parent.potions.pick_random()
	flavorText = parent.flavorTexts[parent.peopleName.find(personName)]
	shadow = parent.shadows.pick_random()

#
#func _pressed():
	#print_debug("clicked on")
	#handleVisibility()
#
#func handleVisibility():
	#currentNodeName = name
	#var req_num = currentNodeName.split("Request")[1]
	#parent.get_node("Details").toggle_menu(req_num)
