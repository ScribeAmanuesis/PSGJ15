@tool
extends PanelContainer

@export var item_resource : InvItem = preload("res://Scenes/Inventory/Items/Potions/rage_potion.tres"):
	set = set_item_resource
	
@export var quantity : = 1 

@onready var item_visual: TextureRect = $MarginContainer/VBoxContainer/TextureRect
@onready var item_name: Label = $MarginContainer/VBoxContainer/HBoxContainer/Label
@onready var quantity_text: Label = $MarginContainer/VBoxContainer/HBoxContainer2/Label2

@onready var container : = $MarginContainer

func _ready():
	set_item_resource(item_resource)

func set_item_resource(item : InvItem):
	item_resource = item
	if container != null:
		if item:
			item_visual.texture = item_resource.texture
			item_name.text = item_resource.name
			quantity_text.text = str(quantity)
			container.visible = true
		else:
			container.visible = false
			
func update(slot : InvSlot):
	if item_resource != slot.item:
		set_item_resource(slot.item)
	quantity = slot.quantity
	quantity_text.text = str(slot.quantity)

#func update(slot: InvSlot):
	#if !slot.item:
		#item_visual.visible = false
	#else:
		#item_visual.visible = true
		#item_visual.texture = slot.item.texture
		#item_name.visible = true
		#item_name.text = slot.item.name
		#quantity_text.visible = true
		#quantity_text.text = str(slot.quantity)

func _get_drag_data(at_position):
	if quantity < 1:
		return null
	
	var preview_texture = TextureRect.new()
	
	preview_texture.texture = item_resource.texture
	preview_texture.expand_mode = 1
	preview_texture.size = Vector2(32,32)
	
	#var preview = Control.new()
	#preview.add_child(preview_texture)
	quantity -= 1
	quantity_text.text = str(quantity)
	
	set_drag_preview(preview_texture)
	return item_resource

func _can_drop_data(_pos, data):
	return data is InvItem and data == item_resource

func _drop_data(_pos, data):
	quantity += 1
	quantity_text.text = str(quantity)
	
