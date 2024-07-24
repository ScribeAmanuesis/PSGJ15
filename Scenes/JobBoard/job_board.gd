extends PanelContainer

var peopleName = [
	"Alice",
	"Bob",
	"Charlie",
	"David",
	"Eve",
	"Frank",
	"Grace",
	"Hannah",
	"Ian",
	"Jack",
	"Kara",
	"Liam",
	"Mia",
	"Nina",
	"Oliver",
	"Paul",
	"Quinn",
	"Ruby",
	"Sam",
	"Tina"
]

var flavorTexts = [
	"A curious explorer always seeking new adventures.",
	"The reliable friend who is always there to lend a hand.",
	"An energetic spirit with a passion for creativity.",
	"A wise and thoughtful soul with a knack for problem-solving.",
	"A tech-savvy genius who loves unraveling mysteries.",
	"A strong and silent type with a heart of gold.",
	"An elegant presence with a talent for bringing people together.",
	"A joyful personality who spreads positivity wherever she goes.",
	"A clever strategist with a love for puzzles.",
	"A brave adventurer always ready to take on new challenges.",
	"A compassionate healer with a gift for empathy.",
	"A charismatic leader who inspires those around him.",
	"A creative artist with a vivid imagination.",
	"A curious mind with an endless thirst for knowledge.",
	"A charming storyteller who captivates his audience.",
	"A steady and reliable presence in any situation.",
	"A free spirit who dances to the beat of their own drum.",
	"A fiery personality with a passion for justice.",
	"A versatile and adaptable friend who can fit into any role.",
	"A meticulous planner with a keen eye for detail."
]

var potions = [
	"Health Potion",
	"Slime Potion",
	"Rage Potion",
]

var bother: Texture2D = preload("res://Assets/EnemyBother.png")
var fret: Texture2D = preload("res://Assets/EnemyFret.png")
var woe: Texture2D = preload("res://Assets/EnemyWoe.png")
var worry: Texture2D = preload("res://Assets/EnemyWorry.png")
var shadows = [
	bother,
	fret,
	woe,
	worry
]

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


func _input(event):
	if Input.is_action_just_pressed("ui_accept"):
		details.show()



