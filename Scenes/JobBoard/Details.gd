extends PopupPanel

@export var container : Container

@onready var title_text : = $VBoxContainer/Title
@onready var shadow_tex : = $VBoxContainer/Shadow/TextureRect
@onready var flavor_text : = $VBoxContainer/Shadow/Label
@onready var potion_text : = $VBoxContainer/Requirements/Label
@onready var potion_tex : = $VBoxContainer/Requirements/TextureRect
@onready var button : = $VBoxContainer/Button

var requestNum
var isCompleted: bool = false

signal setComplete

var shadowObject: PackedScene
var showing : = false


func _ready():
	button.pressed.connect(turnIn)
	container.mouse_exited.connect(hide)

func _process(delta):
	var mouse_pos : Vector2i = get_parent().get_viewport().get_mouse_position()
	if container.get_rect().has_point(mouse_pos):
		pass
	else:
		pass

func _input(event):
	if event.is_pressed() and event.button_index == MOUSE_BUTTON_LEFT:
		show()

func turnIn():
	isCompleted = true
	var request = get_parent().get_node("GridContainer").get_node(requestNum)
	
	#consume invnentory
	var didConsume = Player.potion_inv.consume(request.job.potion, 1)
	if didConsume:
		request.isCompleted = true
		button.text = "Completed"
		button.disabled = true
		Player.shadows[shadowObject] -= 1
	elif !didConsume:
		print("Not enough Materials")
	#print("Player before is " + str(Player.shadows))
	#print("Player after is " + str(Player.shadows))

func checkComplete(isComplete):
	if isComplete:
		button.text = "Completed"
		button.disabled = true
	else:
		button.text = "Turn In"
		button.disabled = false

func set_shadow(shadow: PackedScene):
	shadowObject = shadow

func set_text(request_num: String, new_title : String, flavor : String, shadow : Texture2D, potion_name : String, potion_texture : Texture2D, complete: bool):
	requestNum = request_num
	title_text.text = new_title
	flavor_text.text = flavor
	shadow_tex.texture = shadow
	potion_text.text = potion_name
	potion_tex.texture = potion_texture
	isCompleted = complete
	checkComplete(complete)
	show()


