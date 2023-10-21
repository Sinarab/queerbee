class_name Bloc

# BLOCS ------------
# type: life | healing | the_sun | nature | serenity | the sprit 
# status: 'infected | not infected' | 'pretected',
# boost: 0 - 4
# connections: 0 - 6
# connected_with: [...blocs]
#----------
const BLOCS_TYPES = ["life", "healing", "the_sun", "nature", "serenity", "the_sprit"]

var type: String
var status: String
var hability: Array[String]
var boost: int
var connections: int
var connected_with: Array[Bloc]

static func create_new_bloc(_type: String):
	var bloc = Bloc.new()
	bloc.type = _type
	bloc.hability = get_hability_by_type(_type)
	bloc.status = "not_infected"
	bloc.boost = 0
	bloc.connections = 0
	return bloc

static func get_hability_by_type(_type: String) -> Array[String]:
	if _type == "life": return ["none"]
	elif _type == "healing": return ["none"]
	elif _type == "the_sun": return ["none"]
	elif _type == "nature": return ["none"]
	elif _type == "serenity": return ["none"]
	elif _type == "the_sprit": return ["none"]
	else: return ["none"]
