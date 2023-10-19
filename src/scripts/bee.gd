class_name Bee

# BEES ------------
# type: 'raiwbow' | 'bi' | 'gay' | 'les' | 'pan' | 'aromantic' | 'trans' | 'bigender' | 'not_bigender' | 'agender'
# hability: ['add_any_bloc' | 'add_<color>_bloc' | 'move_bloc' | 'change_bloc' | 'change_bloc_chain' | 'destroy_bloc' | 'open_new_space' | 'kill_enemy' | 'kill_rock' | 'heal_bee' ]
# life: 0 - 10
# status: 'idle' | 'working' | 'dead'
#----------

var type: String
var hability: Array[String]
var life: int
var status: String

static func create_new_bee(_type: String):
	var bee = Bee.new()
	bee.type = _type
	bee.hability = get_hability_by_type(_type)
	bee.life = 0
	bee.status = "idle"
	return bee

static func get_hability_by_type(type: String) -> Array[String]:
	if type == "rainbow": return ["add_any_bloc"]
	elif type == "bi": return ["add_life_bloc", "add_the_sprit_bloc"]
	elif type == "gay": return ["add_nature_bloc", "add_serenity_bloc"]
	elif type == "les": return ["add_life_bloc", "add_healing_bloc"]
	elif type == "pan": return ["add_yellow_bloc", "add_serenity_bloc"]
	elif type == "aromantic": return ["add_green_bloc", "change_bloc"]
	elif type == "trans": return ["move_bloc"]
	elif type == "bigender": return ["open_new_space", "heal_bee"]
	elif type == "not_bi": return ["open_new_space", "kill_spider", "kill_rock"]
	elif type == "agender": return ["change_bloc", "change_bloc_chain"]
	else: return ["none"]
