extends Control

var personName: String
var potion: String
var flavorText: String
# Called when the node enters the scene tree for the first time.
func _ready():
	#pas
	personName = get_parent().peopleName.pick_random()
	potion = get_parent().potions.pick_random()
	flavorText = get_parent().flavorTexts[get_parent().peopleName.find(personName)]
	#print(personName)
	#print(potion)
	#pass # Replace with function body.
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
