extends Node2D


func _ready():
	$Control/ColorRect/RectAnimationPlayer.play("fade_out")
	$Bee/BeeAnimationPlayer.play("moviment")

func _on_start_text_timer_timeout():
	$AnimatedText.start_timer()
	$RainbowAnimatedSprite.visible = true;


func _on_rect_animation_player_animation_finished(anim_name):
	pass


func _on_bee_animation_player_animation_finished(anim_name):
	if anim_name == "moviment":
		$Bee/BeeAnimationPlayer.play("pulse")
