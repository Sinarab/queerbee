extends Node2D

@onready var tile_map: TileMap = get_node("TileMap")

var selected_bloc: NodeBloc
var selected_bloc_pressed = false

var current_action: = "idle" # "selecting_position" | "idle"
const bloc_scene: PackedScene = preload("res://src/scenes/bloc.tscn")

func _ready():
	PlayerData.connect("new_bloc_event", add_bloc)
	PlayerData.connect("selected_node_bloc_event", update_selected_bloc)
	var test_bloc = Bloc.create_new_bloc("nature")
	var test_bloc_node: NodeBloc = get_node('Bloc')
	test_bloc_node.bloc = test_bloc

func add_bloc(bloc):
	current_action = "selectiong_position"
	var bloc_instance: NodeBloc = bloc_scene.instantiate()
	bloc_instance.bloc = bloc
	add_child(bloc_instance)

func update_selected_bloc(node_bloc):
	selected_bloc = node_bloc


func _input(event):
#manage bloc movement snaping to tile map grid
	if selected_bloc:
		if event is InputEventMouseButton:
			if event.is_pressed():
				if event.button_index == MOUSE_BUTTON_LEFT:
					selected_bloc_pressed = true
			if event.is_released():
				if event.button_index == MOUSE_BUTTON_LEFT:
					selected_bloc_pressed = false
		if event is InputEventMouseMotion and selected_bloc_pressed:
			var snap_to = get_position_with_tile_map(event)
			selected_bloc.position = snap_to
		if event is InputEventKey:
			if event.is_released() and event.keycode == 4194312:
				selected_bloc.queue_free()

func get_position_with_tile_map(event: InputEventMouseMotion) -> Vector2:
	var pos_clicked = tile_map.local_to_map(get_global_mouse_position())
	var tile_set_global_position = tile_map.map_to_local(pos_clicked)
	return tile_set_global_position
