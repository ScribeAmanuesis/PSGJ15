extends Area2D
class_name Putdown

signal got_item(item)

var can_put_down : = true

func put_down(item : Object) -> Object:
	if can_put_down:
		got_item.emit(item)
		return null
	return item

