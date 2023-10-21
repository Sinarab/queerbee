extends Node2D

func _ready():
	$FlyingBee.play()

func _on_show_bee_actions_button_pressed():
	var buttons_menu = $ButtonsMenuControl
	buttons_menu.visible = not buttons_menu.visible
