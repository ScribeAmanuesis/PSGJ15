extends Resource

class_name Inv

signal update

#@export var ingredient_legend: Array[InvItem]

@export var slots: Array[InvSlot]

func insert(item: InvItem):
	print("calling insert of an item")
	var itemslots = slots.filter(func(slot): return slot.item == item)
	if !itemslots.is_empty():
		#print("slots not empty")
		itemslots[0].quantity += 1
	else:
		var emptyslots = slots.filter(func(slot): return slot.item == null)
		#print("condition2")
		if !emptyslots.is_empty():
			emptyslots[0].item = item
			emptyslots[0].quantity = 1
	update.emit()

func consume(item: InvItem):
	var itemslots = slots.filter(func(slot): return slot.item == item)
	if !itemslots.is_empty():
			itemslots[0].quantity -= 1
