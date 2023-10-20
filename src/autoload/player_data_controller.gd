extends Node

# esse controller vai gerenciar o status global e tomar
# decisões com base nos blocos, abelhas e tempo de jogo

#BLOCS ------------

signal update_blocs
signal new_bloc_event
signal selected_node_bloc_event(node_bloc)

var blocs: Array = [Bloc.create_new_bloc("nature")] :
	get: return blocs
	set(value): emit_signal("update_blocs")

func add_bloc(bloc: Bloc):
	blocs.push_back(bloc)
	emit_signal("update_blocs")
	emit_signal("new_bloc_event", bloc)

var selected_node_bloc :
	get: return selected_node_bloc
	set(node_bloc): selected_node_bloc = on_selected_node_bloc_event(node_bloc)

func on_selected_node_bloc_event(node_bloc: NodeBloc):
	emit_signal("selected_node_bloc_event", node_bloc)
	return node_bloc
#----------

# BEES ------------

signal update_bees
var bees: = [Bee.create_new_bee("rainbow")] # 2 bees
#----------

# ENEMIES ------------

signal update_enemies

var enemies = []                     # 3 rocks
const rock_appear_percentage = 0.15  # 15%
var spider_timer = 60 * 5 :          # 5min
	get: return spider_timer
	set(value): emit_signal("update_enemies")
#----------

# INTERFACE CONTENTS ------------

signal update_union

var union = 100 :
	get: return union
	set(value): emit_signal("update_union")

var total_number_of_bees = bees.size()
var total_number_of_blocs = blocs.size()
# get all blocs and count only the nature type plus + boost
var total_number_of_resources = blocs.filter(func(b): return b.type == 'nature').size()
#----------
