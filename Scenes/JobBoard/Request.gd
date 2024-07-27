extends TextureButton

var personName: String
var potionName: String
var potion: Texture2D
var flavorText: String
var shadow: Texture2D
var shadowObject: PackedScene
var job: Job
#var currentNodeName:String

@onready var parent : = get_parent().get_parent()

func _ready():
	job = parent.jobs.pick_random()
	
	personName = job.name
	potionName = job.potion.name
	potion = job.potion.texture
	flavorText = job.flavorText
	shadow = job.shadowImage
	shadowObject = job.shadowObject
	
	Player.requests.append(job)
	#print(Player.shadows)
	Player.shadows[shadowObject] += 1
