extends Panel

@onready var item_visual: Sprite2D = $CenterContainer/Panel/item_display
@onready var item_name: Label = $CenterContainer/Panel/item_name
@onready var quantity_text: Label = $CenterContainer/Panel/item_quantity

func update(slot: InvSlot):
	if !slot.item:
		item_visual.visible = false
	else:
		item_visual.visible = true
		item_visual.texture = slot.item.texture
		item_name.visible = true
		item_name.text = slot.item.name
		quantity_text.visible = true
		quantity_text.text = str(slot.quantity)

