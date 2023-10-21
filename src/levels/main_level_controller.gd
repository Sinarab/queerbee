extends Node2D

@onready var tile_map: TileMap = get_node("TileMap")
@onready var camera: Camera2D = get_node("Camera2D")

var selected_bloc: NodeBloc
var selected_bloc_pressed = false

const bloc_scene: PackedScene = preload("res://src/scenes/bloc.tscn")
const enemy_scene: PackedScene = preload("res://src/scenes/enemy.tscn")

func _ready():
	PlayerData.connect("new_bloc_event", add_bloc)
	PlayerData.connect("selected_node_bloc_event", update_selected_bloc)
	add_enemy()

func add_enemy():
	var enemy_instance: EnemyNode = enemy_scene.instantiate()
	enemy_instance.enemy = Enemy.create_new_enemy()
	add_child(enemy_instance)
	center_instance_with_tile_map(enemy_instance, true)
	

func add_bloc(bloc: Bloc):
	var bloc_instance: NodeBloc = bloc_scene.instantiate()
	bloc_instance.bloc = Bloc.create_new_bloc(bloc.type)
	add_child(bloc_instance)
	center_instance_with_tile_map(bloc_instance, false, true)

func center_instance_with_tile_map(instance, randomize = false, center = false):
	var free_cells = tile_map.get_used_cells(0)
	var free_cell_index = 0
	var bloc_position_atlas = Vector2.ZERO
	if randomize:
		free_cell_index = randi_range(0, free_cells.size())
		bloc_position_atlas = free_cells[free_cell_index]
	elif center:
		var center_camera_tile = tile_map.local_to_map(camera.get_screen_center_position())
		var valid_near_position = free_cells.reduce(get_nearst_valid_coords_for_instance, Vector2.ZERO)
		bloc_position_atlas = valid_near_position

	var bloc_position_global = tile_map.map_to_local(bloc_position_atlas)
	instance.position = bloc_position_global 

func get_nearst_valid_coords_for_instance(current_closest: Vector2, coords: Vector2):
	var ref = get_center_camera_tile_coord()
	var diff_from_ref = ref.length() - coords.length()
	if current_closest.length() < diff_from_ref: return current_closest
	else: return ref

func get_center_camera_tile_coord():
	return tile_map.local_to_map(camera.get_screen_center_position())

func update_selected_bloc(node_bloc):
	selected_bloc = node_bloc

func _input(event):
	if selected_bloc:
		if event is InputEventMouseButton:
			if event.is_pressed():
				if event.button_index == MOUSE_BUTTON_LEFT:
					selected_bloc_pressed = true
			if event.is_released():
				if event.button_index == MOUSE_BUTTON_LEFT:
					selected_bloc_pressed = false
		if event is InputEventMouseMotion and selected_bloc_pressed:
			set_bloc_position_with_tile_map()

		if event is InputEventKey:
			if event.is_released() and event.keycode == 4194312:
				selected_bloc.queue_free()

func set_bloc_position_with_tile_map() -> void:
	var pos_clicked = tile_map.local_to_map(get_global_mouse_position())
	var atlas_coord = tile_map.get_cell_atlas_coords(0, pos_clicked)
	if atlas_coord.x == -1 and atlas_coord.y == -1:
		pass
	else:
		var tile_set_global_position = tile_map.map_to_local(pos_clicked)
		selected_bloc.position = tile_set_global_position
