class_name Enemy

# Enemys ------------
# type: 'spider'
# life: 1
# power: 1 - 4
#----------

var type: String
var life: int
var power: int

static func create_new_enemy() -> Enemy:
	var enemy = Enemy.new()
	enemy.type = "spider"
	enemy.life = randi_range(1, 2) 
	enemy.power = randi_range(1, 4) 
	return enemy
