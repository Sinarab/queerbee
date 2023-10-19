class_name NodeBloc extends Node2D

@export var bloc_type: = ""
@export var bloc_position: = Vector2(0, 0)

@onready var bloc: Bloc = Bloc.create_new_bloc(bloc_type)
@onready var sprit_bloc: Sprite2D = get_node("BlocSprite")

const bloc_enabled = preload("res://assets/blocs/bloco01.png")
const bloc_nature = preload("res://assets/blocs/bloco_verde.png")

const can_move = false;

func _ready():
	print(sprit_bloc)
	if bloc_type == "nature":
		sprit_bloc.texture = bloc_nature
	else: sprit_bloc.texture = bloc_enabled

func _input(event):
	if event is InputEventMouseButton and can_move:
		if event.is_pressed():
			print("pressed")
		if event.is_released():
			print("relesed")
