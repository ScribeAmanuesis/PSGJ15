@tool
extends PanelContainer

@export var item_resource : InvItem = preload("res://Scenes/Inventory/Items/Potions/rage_potion.tres"):
	set = set_item_resource
	
@export var item_type : ITEM_TYPE
enum ITEM_TYPE {
	INGREDIENT,
	POTION,
	TOWER
}
	
@export var quantity : = 0

@onready var item_visual: TextureRect = $MarginContainer/VBoxContainer/TextureRect
@onready var item_name: Label = $MarginContainer/VBoxContainer/HBoxContainer/Label
@onready var quantity_text: Label = $MarginContainer/VBoxContainer/HBoxContainer2/Label2

@onready var container : = $MarginContainer

var drag_started : = false

func _ready():
	set_item_resource(item_resource)
	
func _notification(what: int) -> void:
	if what == NOTIFICATION_DRAG_END and not is_drag_successful() and drag_started:
		drag_started = false
		get_inventory().insert(item_resource)
		update_quantity()
		
func set_item_resource(item : InvItem):
	item_resource = item
	if container != null:
		if item:
			item_visual.texture = item_resource.texture
			item_name.text = item_resource.name
			update_quantity()
			container.visible = true
		else:
			container.visible = false
			
func update(slot : InvSlot):
	if item_resource != slot.item:
		set_item_resource(slot.item)
	quantity = slot.quantity
	update_quantity()

func _get_drag_data(at_position):
	if quantity < 1:
		return null
	
	drag_started = true
	
	var preview_texture = TextureRect.new()
	
	quantity_text.text = str(quantity)
	preview_texture.texture = item_resource.texture
	preview_texture.expand_mode = 1
	preview_texture.size = Vector2(32,32)
	
	get_inventory().consume(item_resource)
	update_quantity()
	
	set_drag_preview(preview_texture)
	return item_resource

func _can_drop_data(_pos, data):
	return data is InvItem and data == item_resource

func _drop_data(_pos, data):
	get_inventory().insert(item_resource)
	update_quantity()
	
func update_quantity():
	quantity_text.text = str(quantity)
	
func get_inventory() -> Inv:
	match item_type:
		ITEM_TYPE.INGREDIENT:
			return Player.ingredient_inv
		ITEM_TYPE.POTION:
			return Player.potion_inv
		ITEM_TYPE.TOWER:
			return Player.tower_inv
		_:
			print_debug("There must be an inventory assigned")
			assert(false)
			return
