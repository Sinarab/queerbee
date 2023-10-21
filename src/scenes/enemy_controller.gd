class_name EnemyNode extends Node2D

var selected = false
var enemy: Enemy:
	get: return enemy
	set(new_enemy): enemy = on_enemy_change(new_enemy)

func _ready():
	add_to_group("blocs")

func on_enemy_change(enemy: Enemy):
	return enemy

func _on_bloc_area_2d_area_entered(area):
	pass

func _on_bloc_area_2d_area_exited(area):
	pass

func _on_bloc_area_2d_mouse_entered():
	selected = true

func _on_bloc_area_2d_mouse_exited():
	selected = false
