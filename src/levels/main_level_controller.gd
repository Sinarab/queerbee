extends Node2D

func _ready():
	PlayerData.connect("new_bloc_event", add_bloc)

func add_bloc(bloc):
	print("TODO instanciar bloco aqui de acordo com o tipo")
