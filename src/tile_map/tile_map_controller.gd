extends TileMap

const main_layer = 0
const main_atlas_id = 0

func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.is_pressed():
			var global_cliked = event.position
#			relative position on tile map
			var pos_clicked = local_to_map(to_local(global_cliked))
#			tile map instances coords
			var current_atlas_coords = get_cell_atlas_coords(main_layer, pos_clicked)
			print(pos_clicked)




#			var current_tile_alt = get_cell_alternative_tile(main_layer, pos_clicked)
#			var number_of_alts_to_click = tile_set.get_source(main_atlas_id).get_alternative_tiles_count(current_atlas_coords)
#			var alternative_tile_alt_loop = (current_tile_alt + 1) % number_of_alts_to_click
#			set_cell(main_layer, pos_clicked, main_atlas_id, current_atlas_coords, alternative_tile_alt_loop)
#			if current_atlas_coords.x == -1 and current_atlas_coords.y == -1:
#				set_cell(main_layer, pos_clicked, main_atlas_id, Vector2(0,0))
