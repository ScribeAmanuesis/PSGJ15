extends PopupPanel

@onready var title_text : = $VBoxContainer/Title
@onready var shadow_tex : = $VBoxContainer/Shadow/TextureRect
@onready var flavor_text : = $VBoxContainer/Shadow/Label
@onready var potion_text : = $VBoxContainer/Requirements/Label
@onready var potion_tex : = $VBoxContainer/Requirements/TextureRect

@onready var button : = $VBoxContainer/Button

#@onready var parent : = get_parent()
var shadowObject: PackedScene
#var activePoster: int 
#var self_opened = false

func _ready():
	button.pressed.connect(turnIn)

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
	#show()
	print()
	print(position)
	print(get_viewport().get_mouse_position())
	position = Vector2(get_viewport().get_mouse_position().x + 50, get_viewport().get_mouse_position().y + 50)
	print(position)
	popup()
