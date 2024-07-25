extends PopupPanel

@onready var title_text : = $VBoxContainer/Title
@onready var shadow_tex : = $VBoxContainer/Shadow/TextureRect
@onready var flavor_text : = $VBoxContainer/Shadow/Label
@onready var potion_text : = $VBoxContainer/Requirements/Label

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
#
#func toggle_menu(posternum):
	#var req = "Request{num}".format({'num':posternum})
	#title.text = parent.get_node(req).personName
	#flavor_text.text = parent.get_node(req).flavorText
	#shadow_tex.texture = parent.get_node(req).shadow
	#
	#if activePoster == int(req) and self.visible:
		#self.visible = false
	#else:
		#self.visible = true
	#activePoster = int(req)
func set_shadow(shadow: PackedScene):
	shadowObject = shadow
func set_text(new_title : String, flavor : String, shadow : Texture2D, potion_name : String):
	title_text.text = new_title
	flavor_text.text = flavor
	shadow_tex.texture = shadow
	potion_text.text = potion_name
	show()
