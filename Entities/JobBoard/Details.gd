extends Control

var activePoster: int 
var self_opened = false
# Called when the node enters the scene tree for the first time.
func toggle_menu(posternum):
	var req = "Request{num}".format({'num':posternum})
	get_node("PersonName").text = get_parent().get_node(req).personName
	get_node("FlavorText").text = get_parent().get_node(req).flavorText
	get_node("Shadow").texture = get_parent().get_node(req).shadow
	
	if activePoster == int(req) and self.visible:
		self.visible = false
	else:
		self.visible = true
	activePoster = int(req)

func _ready():
	#print(get_parent())
	pass
	
