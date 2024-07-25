extends PanelContainer

var Alice: Job = preload("res://Scenes/JobBoard/Jobs/Alice.tres")
var Bob: Job = preload("res://Scenes/JobBoard/Jobs/Bob.tres")
var Charlie: Job = preload("res://Scenes/JobBoard/Jobs/Charlie.tres")
var David: Job = preload("res://Scenes/JobBoard/Jobs/David.tres")
var Eve: Job = preload("res://Scenes/JobBoard/Jobs/Eve.tres")
var Frank: Job = preload("res://Scenes/JobBoard/Jobs/Frank.tres")
var Grace: Job = preload("res://Scenes/JobBoard/Jobs/Grace.tres")
var Hannah: Job = preload("res://Scenes/JobBoard/Jobs/Hannah.tres")
var Ian: Job = preload("res://Scenes/JobBoard/Jobs/Ian.tres")
var Jack: Job = preload("res://Scenes/JobBoard/Jobs/Jack.tres")
var Kara: Job = preload("res://Scenes/JobBoard/Jobs/Kara.tres")
var Liam: Job = preload("res://Scenes/JobBoard/Jobs/Liam.tres")
var Mia: Job = preload("res://Scenes/JobBoard/Jobs/Mia.tres")
var Nina: Job = preload("res://Scenes/JobBoard/Jobs/Nina.tres")
var Oliver: Job = preload("res://Scenes/JobBoard/Jobs/Oliver.tres")
var Paul: Job = preload("res://Scenes/JobBoard/Jobs/Paul.tres")
var Quinn: Job = preload("res://Scenes/JobBoard/Jobs/Quinn.tres")
var Ruby: Job = preload("res://Scenes/JobBoard/Jobs/Ruby.tres")
var Sam: Job = preload("res://Scenes/JobBoard/Jobs/Sam.tres")
var Tina: Job = preload("res://Scenes/JobBoard/Jobs/Tina.tres")

var jobs = [Alice, Bob, Charlie, David, Eve, Frank, Grace, Hannah, Ian, Jack, Kara, Liam, Mia, Nina, Oliver, Paul, Quinn, Ruby, Sam, Tina]

var potions = [
	"Health Potion",
	"Slime Potion",
	"Rage Potion",
]

#var bother: Texture2D = preload("res://Assets/EnemyBother.png")
#var fret: Texture2D = preload("res://Assets/EnemyFret.png")
#var woe: Texture2D = preload("res://Assets/EnemyWoe.png")
#var worry: Texture2D = preload("res://Assets/EnemyWorry.png")
#var shadows = [bother,fret,woe,worry]

@onready var details : PopupPanel= $Details
@onready var requests_container = $GridContainer

func _ready():
	for request in requests_container.get_children():
		request.pressed.connect(details.set_text.bindv([
			request.personName,
			request.flavorText,
			request.shadow,
			request.potionName
		]))
		request.pressed.connect(details.set_shadow_name.bindv([
			request.shadowName
		]))


func _input(event):
	if Input.is_action_just_pressed("ui_accept"):
		details.show()



