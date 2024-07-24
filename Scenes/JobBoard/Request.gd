extends TextureButton

var personName: String
var potionName: String
var flavorText: String
var shadow: Texture2D
var job: Job
#var currentNodeName:String

@onready var parent : = get_parent().get_parent()

func _ready():
	job = parent.jobs.pick_random()
	
	personName = job.name
	potionName = job.potion.name
	flavorText = job.flavorText
	shadow = job.shadowImage

#
#func _pressed():
	#print_debug("clicked on")
	#handleVisibility()
#
#func handleVisibility():
	#currentNodeName = name
	#var req_num = currentNodeName.split("Request")[1]
	#parent.get_node("Details").toggle_menu(req_num)
