extends Control

@onready var scene_tree: = get_tree()
#BLOCS
@onready var blocs_label: Label = get_node("BlocsLabel")
@onready var resource_label: Label = get_node("ResourceLabel")
#BEES
@onready var bees_label: Label = get_node("BeesLabel")
@onready var bee_life_label1: Label = get_node("BeeLifeLabel1")
@onready var bee_life_label2: Label = get_node("BeeLifeLabel2")
#UNION
@onready var union_label: Label = get_node("UnionLabel")
@onready var unio_progress_bar: ProgressBar = get_node("UnioProgressBar")
#ENEMY
@onready var spider_timer_label: Label = get_node("SpiderTimerLabel")
@onready var spider_timer_progress_bar: ProgressBar = get_node("SpiderTimerProgressBar")

const bloc_enabled = preload("res://assets/blocs/bloco01.png")
const bloc_the_sun = preload("res://assets/blocs/bloco_amarelo.png") # -1
const bloc_serenity = preload("res://assets/blocs/bloco_azul.png") # 0
const bloc_healing = preload("res://assets/blocs/bloco_laranja.png") # 1
const bloc_the_sprit = preload("res://assets/blocs/bloco_roxo.png") # 2
const bloc_nature = preload("res://assets/blocs/bloco_verde.png") # 3
const bloc_life = preload("res://assets/blocs/bloco_vermelho.png") # 4

func _ready():
	PlayerData.connect("update_blocs", update_interface_blocs)
	PlayerData.connect("update_bees", update_interface_bees)
	PlayerData.connect("update_enemies", update_interface_enemies)
	PlayerData.connect("update_union", update_interface_union)
	update_interface_blocs()
	update_interface_bees()
	update_interface_enemies()
	update_interface_union()

func update_interface_blocs() -> void:
	blocs_label.text = "%s Blocos" % str(PlayerData.total_number_of_blocs)
	resource_label.text = "%s" % str(PlayerData.total_number_of_resources)
	
func update_interface_union() -> void:
	unio_progress_bar.value = PlayerData.union
	union_label.text = str(PlayerData.union) + "%"

func update_interface_bees() -> void:
	bees_label.text = "%s Bees" % str(PlayerData.total_number_of_bees)
	bee_life_label1.text = "3/3"
	bee_life_label2.text = "3/3"

func update_interface_enemies() -> void:
	spider_timer_progress_bar.value = PlayerData.spider_timer
	spider_timer_label.text = str(PlayerData.spider_timer)


func _on_show_bee_actions_menu_pressed(bee_type):
	var action_menu: Control = get_node("ActionMenu")
	action_menu.visible = not action_menu.visible

	if action_menu.visible:
		if bee_type == "rainbow":
			var actions_select: OptionButton = get_node("ActionMenu/ActionsSelectionButton")
			actions_select.add_icon_item(bloc_the_sun, "The sun", -1)
			actions_select.add_icon_item(bloc_serenity, "Serenity", 0)
			actions_select.add_icon_item(bloc_healing, "Healing", 1)
			actions_select.add_icon_item(bloc_the_sprit, "The sprit", 2)
			actions_select.add_icon_item(bloc_nature, "Nature", 3)
			actions_select.add_icon_item(bloc_life, "Life", 4)



func _on_actions_selection_button_item_selected(index):
	var actions_select: OptionButton = get_node("ActionMenu/ActionsSelectionButton")
	var item_id = actions_select.get_item_id(index)
	if item_id == 4:
		var bloc = Bloc.create_new_bloc("life")
		PlayerData.add_bloc(bloc)