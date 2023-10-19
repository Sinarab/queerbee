extends Node

# esse controller vai gerenciar o status global e tomar
# decisões com base nos blocos, abelhas e tempo de jogo

# BLOCS ------------
var blocs: Array = [Bloc.create_new_bloc("nature")] :
	get: return blocs
	set(value): emit_signal("update_blocs")

func add_bloc(bloc: Bloc):
	blocs.push_back(bloc)
	emit_signal("update_blocs")
	emit_signal("new_bloc_event", bloc)
	print(blocs)

# BEES ------------
# type: 'raiwbow' | 'bi' | 'gay' | 'les' | 'pan' | 'aromantic' | 'trans' | 'bigender' | 'not_bigender' | 'agender'
# hability: ['add_bloc' | 'move_bloc' | 'change_bloc' | 'change_bloc_chain' | 'destroy_bloc' | 'open_new_space' | 'kill_enemy' | 'kill_rock' | 'heal_bee' ]
# life: 0 - 10
# status: 'idle' | 'working' | 'dead'
#----------
var bees: = [Bee.create_new_bee("rainbow")] # 2 bees

# ENEMIES ------------
# type: 'rock' | 'spider' | 'blocked_bloc'
# hability: ['obstruction' | 'move' | 'destroy_bloc']
# life = 0 | 1
# connected_with: [...blocs]
var enemies = []                     # 3 rocks
const rock_appear_percentage = 0.15  # 15%
var spider_timer = 60 * 5 :          # 5min
	get: return spider_timer
	set(value): emit_signal("update_enemies")

#----------

# SIGNALS ------------
signal update_blocs
signal new_bloc_event
signal update_bees
signal update_enemies
signal update_union
#----------

# INTERFACE CONTENTS ------------
var union = 100 :
	get: return union
	set(value): emit_signal("update_union")

var total_number_of_bees = bees.size()
var total_number_of_blocs = blocs.size()
# get all blocs and count only the nature type plus + boost
var total_number_of_resources = blocs.filter(func(b): return b.type == 'nature').size()
#----------
