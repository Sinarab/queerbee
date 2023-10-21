extends TileMap

var layer_index = 0
const main_atlas_id = 0

func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_RIGHT and event.is_pressed():
			var global_cliked = event.position
#			relative position on tile map
			var pos_clicked = local_to_map(to_local(global_cliked))
#			tile map instances coords
			var current_atlas_coords = get_cell_atlas_coords(layer_index, pos_clicked)
			var tile_data = get_cell_tile_data(layer_index, pos_clicked)
			print(pos_clicked)
			if tile_data:
				var layer_name = get_layer_name(layer_index)
