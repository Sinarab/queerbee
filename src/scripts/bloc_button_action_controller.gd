extends TextureButton

func _on_bloc_the_sun_pressed(extra_arg_0):
	var bloc = Bloc.create_new_bloc("the_sun")
	PlayerData.add_bloc(bloc)

func _on_bloc_the_nature_pressed(extra_arg_0):
	var bloc = Bloc.create_new_bloc("nature")
	PlayerData.add_bloc(bloc)

func _on_bloc_healing_pressed(extra_arg_0):
	var bloc = Bloc.create_new_bloc("healing")
	PlayerData.add_bloc(bloc)

func _on_bloc_the_sprit_pressed(extra_arg_0):
	var bloc = Bloc.create_new_bloc("the_sprit")
	PlayerData.add_bloc(bloc)

func _on_bloc_life_pressed(extra_arg_0):
	var bloc = Bloc.create_new_bloc("life")
	PlayerData.add_bloc(bloc)

func _on_bloc_serenity_pressed(extra_arg_0):
	var bloc = Bloc.create_new_bloc("serenity")
	PlayerData.add_bloc(bloc)
