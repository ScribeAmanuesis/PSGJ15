extends PopupPanel

@export var container : Container

@onready var title_text : = $VBoxContainer/Title
@onready var shadow_tex : = $VBoxContainer/Shadow/TextureRect
@onready var flavor_text : = $VBoxContainer/Shadow/Label
@onready var potion_text : = $VBoxContainer/Requirements/Label
@onready var potion_tex : = $VBoxContainer/Requirements/TextureRect
@onready var button : = $VBoxContainer/Button

var shadowObject: PackedScene
var showing : = false

func _ready():
	button.pressed.connect(turnIn)
	container.mouse_entered.connect(set.bind("showing", true))
	#container.mouse_exited.connect(hide)
	container.mouse_exited.connect(set.bind("showing", false))

	
func _process(delta):
	var mouse_pos : Vector2i = get_parent().get_viewport().get_mouse_position()
	if container.get_rect().has_point(mouse_pos):
		popup(Rect2i(position + Vector2i(get_viewport().get_mouse_position()), Vector2i(150,200)))
	else:
		hide()
		
func turnIn():
	#Player.shadows[shadowObject] -= 1
	button.text = "Completed"
	button.disabled = true

func set_shadow(shadow: PackedScene):
	shadowObject = shadow
	
func set_text(new_title : String, flavor : String, shadow : Texture2D, potion_name : String, potion_texture : Texture2D):
	title_text.text = new_title
	flavor_text.text = flavor
	shadow_tex.texture = shadow
	potion_text.text = potion_name
	potion_tex.texture = potion_texture
	popup(Rect2i(position + Vector2i(get_viewport().get_mouse_position()), Vector2i(150,200)))	
