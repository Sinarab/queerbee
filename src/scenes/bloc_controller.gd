class_name NodeBloc extends Node2D

var bloc: Bloc:
	get: return bloc
	set(new_bloc): bloc = on_bloc_change(new_bloc)

const bloc_the_sun = preload("res://assets/blocs/bloco_amarelo.png") # -1
const bloc_serenity = preload("res://assets/blocs/bloco_azul.png") # 0
const bloc_healing = preload("res://assets/blocs/bloco_laranja.png") # 1
const bloc_the_sprit = preload("res://assets/blocs/bloco_roxo.png") # 2
const bloc_nature = preload("res://assets/blocs/bloco_verde.png") # 3
const bloc_life = preload("res://assets/blocs/bloco_vermelho.png") # 4

var selected = false
var number_of_connections = 0

func _ready():
	add_to_group("blocs")

func _on_bloc_area_2d_mouse_entered():
	selected = true
	PlayerData.selected_node_bloc = self

func _on_bloc_area_2d_mouse_exited():
	selected = false
	PlayerData.selected_node_bloc = null

func on_bloc_change(new_bloc: Bloc) -> Bloc:
	var sprit_bloc: Sprite2D = get_node("BlocSprite")
	if new_bloc.type in Bloc.BLOCS_TYPES and sprit_bloc:
		if new_bloc.type == "the_sun" :
			sprit_bloc.texture = bloc_the_sun
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

# ENTERED  ------------
func _on_s_area_2d_area_entered(area):
	number_of_connections += 1
	check_connection()
func _on_sr_area_2d_area_entered(area):
	number_of_connections += 1
	check_connection()
func _on_sl_area_2d_area_entered(area):
	number_of_connections += 1
	check_connection()
func _on_il_area_2d_area_entered(area):
	number_of_connections += 1
	check_connection()
func _on_ir_area_2d_area_entered(area):
	number_of_connections += 1
	check_connection()
func _on_i_area_2d_area_entered(area):
	number_of_connections += 1
	check_connection()
#----------

# EXISTED  ------------
func _on_s_area_2d_area_exited(area):
	number_of_connections -= 1
func _on_sr_area_2d_area_exited(area):
	number_of_connections -= 1
func _on_sl_area_2d_area_exited(area):
	number_of_connections -= 1
func _on_il_area_2d_area_exited(area):
	number_of_connections -= 1
func _on_ir_area_2d_area_exited(area):
	number_of_connections -= 1
func _on_i_area_2d_area_exited(area):
	number_of_connections -= 1
#----------

func check_connection():
	if number_of_connections == 6:
		print("UNIÃO")
