extends Resource

class_name Inv

signal update
signal item_added
signal item_removed


#@export var ingredient_legend: Array[InvItem]

@export var slots: Array[InvSlot]

func _ready():
	update.emit()

func insert(item: InvItem):
	var itemslots = slots.filter(func(slot): return slot.item == item)
	if !itemslots.is_empty():
		itemslots[0].quantity += 1
	else:
		var emptyslots = slots.filter(func(slot): return slot.item == null)
		if !emptyslots.is_empty():
			emptyslots[0].item = item
			emptyslots[0].quantity = 1
	update.emit()
	item_added.emit()

func consume(item: InvItem, amount: = 1):
	#print("consuming ingredients")
	var itemslots = slots.filter(func(slot): return slot.item == item)
	#print(itemslots.is_empty())
	if !itemslots.is_empty():
		#print("entered statement, not empty")
		#print(itemslots[0].quantity)
		if(itemslots[0].quantity >= amount):
			itemslots[0].quantity -= amount
			print(itemslots[0].quantity)
		else:
			print("Not enough materials")
			return false
	update.emit()
	item_removed.emit()
	return true
