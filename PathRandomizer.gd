@tool
extends Node2D

@export var generate_path : bool :
	set(_bool) : _generate_path()
	
@export var clear_path : bool :
	set(_bool) : _clear_path()
	
@export var map_size : Rect2i
@export var tilemap : TileMap
@export var path : Path2D
@export var background_tile_id : = 7

@onready var start : = $Start
@onready var end : = $End

var cell_stack : = []
var dead_ends : = []
var last_direction : = Vector2i.RIGHT
var end_found : = false :
	set = set_end_found


func _generate_path():
	_clear_path()
	#Pick the starting cell and add it to the stack
	var starting_cell : = tilemap.local_to_map(tilemap.to_local(start.global_position))
	cell_stack.append(starting_cell)
	path.curve.add_point(starting_cell * tilemap.tile_set.tile_size)
	tilemap.set_cells_terrain_connect(0, [starting_cell],0, 0)
	
	
func _clear_path():
	tilemap.clear()
	path.curve.clear_points()
	end_found = false
	cell_stack = [] 
	dead_ends = []
	
func _process(delta):
	queue_redraw()
	if cell_stack and not end_found:
		var current_cell : Vector2i = cell_stack.back()
		if current_cell == tilemap.local_to_map(end.global_position):
			end_found = true
			# END condition found
			return
		var random_direction_array : = [Vector2i.RIGHT, Vector2i.LEFT, Vector2i.UP, Vector2i.DOWN]
		##HACK: this is how its weighted towards straighter paths
		random_direction_array.append(last_direction)
		random_direction_array.append(last_direction)
		random_direction_array.shuffle()
		var next_cell : Vector2i = current_cell
		while random_direction_array:
			if map_size.has_point(next_cell) and \
				not cell_stack.has(next_cell) and \
				not dead_ends.has(next_cell) and \
				get_neighbor_count(next_cell) <= 2:
					break
			else:
				var dir = random_direction_array.pop_back()
				next_cell = current_cell + dir
				last_direction = dir
		##HACK: This is bad, I need to fix it
		if not random_direction_array and (not map_size.has_point(next_cell) or cell_stack.has(next_cell) or dead_ends.has(next_cell)):
			var cell : Vector2i = cell_stack.pop_back()
			tilemap.set_cell(0, cell)
			dead_ends.append(cell)
			
		else:
			cell_stack.append(next_cell)
			tilemap.set_cells_terrain_connect(0, [next_cell],0, 0)
		
func _draw():
	# This makes it only draw the bounds in the editor
	if Engine.is_editor_hint():
		draw_rect(
			Rect2i(
				map_size.position * tilemap.tile_set.tile_size, 
				map_size.size * tilemap.tile_set.tile_size
			),
			Color(Color.RED, 0.3),
			false,
			10.0
		)

func get_neighbor_count(cell : Vector2i) -> int:
	var count : = 0
	for x in [-1,0,1]:
		for y in [-1,0,1]:
			if x == 0 and y == 0:
				continue
			if tilemap.get_cell_source_id(0, cell + Vector2i(x,y)) != -1:
				count += 1
	return count

func set_end_found(is_found : bool) -> void:
	end_found = is_found
	if end_found:
		#Set tilemap to default background tile
		for x in range(map_size.size.x):
			for y in range(map_size.size.y):
				var cell : = map_size.position + Vector2i(x,y)
				if cell_stack.has(cell):
					continue
				tilemap.set_cell(0, cell, background_tile_id, Vector2i.ZERO)
		#Generate curve
		for point in cell_stack:
			path.curve.add_point(point * tilemap.tile_set.tile_size)








