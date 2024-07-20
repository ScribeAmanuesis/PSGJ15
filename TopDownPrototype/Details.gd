extends Control

var activePoster: int 
var self_opened = false
# Called when the node enters the scene tree for the first time.
func toggle_menu(posternum):
	match posternum:
		1:
			get_node("PersonName").text = get_parent().get_node("Request").personName
			get_node("FlavorText").text = get_parent().get_node("Request").flavorText
		2:
			get_node("PersonName").text = get_parent().get_node("Request2").personName
			get_node("FlavorText").text = get_parent().get_node("Request2").flavorText
		3:
			get_node("PersonName").text = get_parent().get_node("Request3").personName
			get_node("FlavorText").text = get_parent().get_node("Request3").flavorText
		4:
			get_node("PersonName").text = get_parent().get_node("Request4").personName
			get_node("FlavorText").text = get_parent().get_node("Request4").flavorText
		5:
			get_node("PersonName").text = get_parent().get_node("Request5").personName
			get_node("FlavorText").text = get_parent().get_node("Request5").flavorText
		6:
			get_node("PersonName").text = get_parent().get_node("Request6").personName
			get_node("FlavorText").text = get_parent().get_node("Request6").flavorText
		7:
			get_node("PersonName").text = get_parent().get_node("Request7").personName
			get_node("FlavorText").text = get_parent().get_node("Request7").flavorText
		8:
			get_node("PersonName").text = get_parent().get_node("Request8").personName
			get_node("FlavorText").text = get_parent().get_node("Request8").flavorText
		9:
			get_node("PersonName").text = get_parent().get_node("Request9").personName
			get_node("FlavorText").text = get_parent().get_node("Request9").flavorText
		10:
			get_node("PersonName").text = get_parent().get_node("Request10").personName
			get_node("FlavorText").text = get_parent().get_node("Request10").flavorText
	self_opened = !self_opened
	if self_opened:
		self.visible = true
	else:
		self.visible = false

func _ready():
	#print(get_parent())
	pass
	
