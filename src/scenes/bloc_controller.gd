class_name NodeBloc extends Node2D

var bloc: Bloc:
	get: return bloc
	set(new_bloc): bloc = on_bloc_change(new_bloc)

const bloc_enabled = preload("res://assets/blocs/bloco01.png")
const bloc_the_sun = preload("res://assets/blocs/bloco_amarelo.png") # -1
const bloc_serenity = preload("res://assets/blocs/bloco_azul.png") # 0
const bloc_healing = preload("res://assets/blocs/bloco_laranja.png") # 1
const bloc_the_sprit = preload("res://assets/blocs/bloco_roxo.png") # 2
const bloc_nature = preload("res://assets/blocs/bloco_verde.png") # 3
const bloc_life = preload("res://assets/blocs/bloco_vermelho.png") # 4

var selected = false
var pressed = false

func _on_bloc_area_2d_mouse_entered():
	selected = true
	PlayerData.selected_node_bloc = self

func _on_bloc_area_2d_mouse_exited():
	selected = false
	pressed = false
	PlayerData.selected_node_bloc = null

func on_bloc_change(new_bloc: Bloc) -> Bloc:
	var sprit_bloc: Sprite2D = get_node("BlocSprite")
	if new_bloc.type in Bloc.BLOCS_TYPES and sprit_bloc:
		if new_bloc.type == "the_sun" :
			sprit_bloc.texture = bloc_nature
		elif new_bloc.type == "serenity" :
			sprit_bloc.texture = bloc_serenity
		elif new_bloc.type == "healing":
			sprit_bloc.texture = bloc_healing
		elif new_bloc.type == "the_sprit":
			sprit_bloc.texture = bloc_the_sprit
		elif new_bloc.type == "nature":
			sprit_bloc.texture = bloc_nature
		elif new_bloc.type == "life":
			sprit_bloc.texture = bloc_life
	return new_bloc


func _on_bloc_area_2d_area_entered(area):
	print("conectados: ", area)


func _on_bloc_area_2d_area_exited(area):
	print("desconectados: ", area)


func _input(event):
	if selected and event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			if event.is_pressed():
				toggle_bloc_menu()
	

func toggle_bloc_menu():
	var menu_control_node: Control = get_node('BlocMenu')
	menu_control_node.visible = not menu_control_node.visible


func _on_erase_bloc_button_button_up():
	queue_free()
