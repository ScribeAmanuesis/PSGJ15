extends Control

var activePoster: int 
var self_opened = false
# Called when the node enters the scene tree for the first time.
func toggle_menu(posternum):
	
	var req = "Request{num}".format({'num':posternum})
	#print(req)
	get_node("PersonName").text = get_parent().get_node(req).personName
	get_node("FlavorText").text = get_parent().get_node(req).flavorText
	#get_node("Person").texture = preload("res://Entities/Enemies/woe.tscn").get_node("Sprite2D")
	
	self_opened = !self_opened
	if self_opened:
		self.visible = true
	else:
		self.visible = false

func _ready():
	#print(get_parent())
	pass
	
