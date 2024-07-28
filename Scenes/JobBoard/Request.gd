extends TextureButton

var requestName: String
var personName: String
var potionName: String
var potion: Texture2D
var flavorText: String
var shadow: Texture2D
var shadowObject: PackedScene
var job: Job
var isCompleted: bool
#var currentNodeName:String

@onready var parent : = get_parent().get_parent()
@onready var details : = get_parent().get_parent().get_node("Details")

func _physics_process(delta):
	pass
	#print(get_node(".").name)
	#print(isCompleted)
func _ready():
	#print(isCompleted)
	#print("reinstancing values")
	requestName = get_node(".").name
	#details.setComplete.connect(turnInRequest)
	job = parent.jobs.pick_random()
	
	personName = job.name
	potionName = job.potion.name
	potion = job.potion.texture
	flavorText = job.flavorText
	shadow = job.shadowImage
	shadowObject = job.shadowObject
	isCompleted = false
	
	Player.requests.append(job)
	#print(Player.shadows)
	Player.shadows[shadowObject] += 1
